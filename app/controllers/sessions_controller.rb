class SessionsController < ApplicationController

  def new
  end

  def index
    @questions = Question.all
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:notice] = "Email or password incorrect."
      redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
