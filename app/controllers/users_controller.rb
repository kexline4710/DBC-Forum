class UsersController < ApplicationController


	def new
		@user = User.new()
	end

	def create
		
		@user = User.new(user_parameters)
		@user.password_confirmation = params[:user][:password_confirmation]
		if @user.save
			flash[:notice] = "New User Created"
			session[:user_id] = @user.id
			redirect_to(user_path(@user))
		else
			flash[:notice] = "User not Created"
			redirect_to("/users/new")
		end
	end

	def user_parameters
		params.require(:user).permit(:name, :email, :password)
	end

	def show

	end

end
