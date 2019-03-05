class AdminsController < ApplicationController
  #devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  before_action :require_admin,only: [:admin,:adduser,:index,:table,:user]
  before_action :require_same_admin,only: [:admin,:adduser,:index,:table,:user]
  before_action :set_admin, only:[:edit,:update]
  def index
    @admins = User.all.where(admin: true)
    @admin = User.order(:username)
      respond_to do |format|
        format.html
        format.csv {send_data @admins.to_csv,filename: "admins-#{Date.today}.csv"}
        format.xls {send_data @admins.to_csv,filename: "admins-#{Date.today}.xls"}
      end
    end
    def rend

    end
  def user

  end
  def newadmin
  end

  def new
    @user = User.new
	end

  def create
		@user = User.new(admin_users_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to VINOVA's Employees Management System, #{@user.username}"
			redirect_to admins_index_path(@user)
		else
			render 'new'
		end
	end
  def edit

	end

	def update
		if @user.update(admin_users_params)
      	#session[:user_id] = @user.id
			flash[:success] = "Your account was updated successfully"
			redirect_to admins_index_path(@user)
		else
			render 'edit'
		end
	end
  def table

  end


    def show

    end

    private
    def set_admin
  	   @user = User.find(params[:id])
    end

    def admin_users_params
      params.require(:user).permit(:username, :email, :password,:avatar,:admin)
    end
    def require_same_admin
  			if !current_user.admin?
  				flash[:danger] = "Liên kết của bạn không tồn tại."
  				redirect_to error_oop_path
        end
  		end
end
