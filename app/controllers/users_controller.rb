class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to VINOVA's Employees Management System, #{@user.username}"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def index

	end

	def edit

	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy

	end

	def show

	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

end