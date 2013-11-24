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
			render :about
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
		@user.update_columns(params[:user])
		redirect_to user_path(@user)
	end
end
