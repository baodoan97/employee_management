class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:new, :create]
    before_action :require_same_user, only: [:edit, :update, :destroy]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to VINOVA's Employees Management System, #{@user.username}"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def index
    @users = User.all.where(admin: nil)
		@user = User.order(:username)
			respond_to do |format|
				format.html
				format.csv {send_data @users.to_csv,filename: "users-#{Date.today}.csv"}
				format.xls {send_data @users.to_csv,filename: "users-#{Date.today}.xls"}
			end
	end
	def report
		@users = User.all
	end
	def edit

	end
	def update
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			if current_user.admin?
					redirect_to admins_user_path(@user)
				else redirect_to user_path(@user)
				end
		else
			render 'edit'
		end
	end

	def destroy
		if @user.admin?
			flash[:danger] = "You can only deletted normal account"
			redirect_to users_path
		else
			@user.destroy
			flash[:success] = "User was deleted successfully"
			redirect_to users_path
		end
	end

	def show

	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password,:avatar)
	end

	def set_user
		@user = User.find(params[:id])
	end
	def require_same_user
			if current_user != @user && !current_user.admin
				flash[:danger] = "You can only edit or delete your own articles"
				redirect_to root_path
			end
		end

end
