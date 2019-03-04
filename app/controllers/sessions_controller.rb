class SessionsController < ApplicationController
	def new
		if logged_in?
			redirect_to tasks_path
		end
	end

	def create
		    user = User.find_by(email: params[:session][:email])
			if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
				if user.admin?
					redirect_to admins_index_path()
				else 	
					redirect_to user_path(user)
				end
			else
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		    end
		# byebug
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

	
end
