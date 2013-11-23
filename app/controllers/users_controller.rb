class UsersController < ApplicationController


	def new
		@user = User.new()
	end

	def create
		@user = User.new(params[:user])
		@user.password_confirmation = params[:user][:password_confirmation]

		if @user.save
			flash[:success] = "New User Created"
			session[:user_id] = @user.id
			redirect_to(user_path(@user))
		else
			flash[:error] = "User not Created"
			redirect_to("/users/new")
		end
	end

	# def user_parameters
	# 	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	# end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		password_confirmation = params[:user][:password]
		if @user.update(params[:user].merge(password_confirmation: password_confirmation))
			redirect_to user_path(@user)
		else
			flash[:error] = "You must specify password and confirmation"
			redirect_to edit_user_path(@user)
		end
	end
end
