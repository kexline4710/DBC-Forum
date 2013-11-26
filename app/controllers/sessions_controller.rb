class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @questions = Question.store_question
    @user = User.find_by_id(params[:user_id])
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      flash[:success] = "Successful signin"
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Email or password incorrect."
      redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
