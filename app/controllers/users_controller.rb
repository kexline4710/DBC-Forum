class UsersController < ApplicationController


	def new
		@user = User.new()
	end

	def create
		
		@user = User.new(params[:user])
		@user.password_confirmation = params[:user][:password_confirmation]
		p @user
		if @user.save
			flash[:notice] = "New User Created"
			session[:user_id] = @user.id
			redirect_to(user_path(@user))
		else
			flash[:notice] = "User not Created"
			redirect_to("/users/new")
		end
	end

	# def user_parameters
	# 	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	# end

	def show

	end

end
