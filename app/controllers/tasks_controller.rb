class TasksController < ApplicationController
	before_action :set_task, only: [:edit, :update, :show, :destroy]
	before_action :remove_images_file, only: [:destroy]
	before_action :require_user
	before_action :require_admin_user, only: [:new, :edit, :update, :destroy]
	def new
		@task = Task.new
	end

	def create
		paTASK = {
        	 "taskname" => task_params[:taskname],
        	 "content" => task_params[:content],
        	 "date" => task_params[:date]
         }
		@task = Task.new(paTASK)
		#tao task = tao usertask
	   # if ['image/jpeg', 'jpeg', 'png'].include?(task_params[:photo][1].content_type)
	   #    flash[:success] = "file type error"
	   # end
		# @task.users << @user
		# @task.taskname = task_params[:taskname]
		# @task.content = task_params[:content]
		# debugger
        @task.images.attach(params[:task][:images])
        if @task.save
        	j=1
        	flag = false
            
            if current_user.admin? == false 
        			@user = current_user
        			@user.tasks << @task
        	else   
	        	while (j<task_params[:user_task_ids].count) do
	        		
		        		@user = User.find(task_params[:user_task_ids][j].to_i)
						@user.tasks << @task
					j += 1
	        	end
        	end
	        flash[:success] = "Task was created successfully"
			redirect_to task_path(@task)
		else
			render 'new'
		end
	end

	def edit

	end

	def update
        paTASK = {
        	 "taskname" => task_params[:taskname],
        	 "content" => task_params[:content],
        	 "date" => task_params[:date]
             }
              @task.images.attach(params[:task][:images])
		if @task.update(paTASK)   
            j=1
            
	        	while (j<task_params[:user_task_ids].count) do
	        		
		        		@user = User.find(task_params[:user_task_ids][j].to_i)
						@user.tasks << @task
					j += 1
	        	end
           
            	
			flash[:success] = "Task was updated"
			redirect_to task_path(@task)
		else
			render 'edit'
		end
	end

	def show
		
	end

	def destroyimage
		
		   if params[:task] 
            @task = Task.find(params[:task])
             @task.images[params[:images].to_i].destroy
		   end
		   redirect_to edit_task_path($s)
		
	end

	def removetaskuser
		
		@usertask = UserTask.find_by(user_id: params[:user], task_id: params[:task])
		# debugger
		@usertask.destroy
		@task = Task.find(params[:task])
        redirect_to edit_task_path(@task)
	end

	def index
		if current_user.admin?
			if params[:date]
				@task = Task.all.where("DATE(date) = ?", params[:date][:date])
			else
				@task = Task.all.where("DATE(date) = ?", Date.today)
			end
		else
			if params[:date]
				@task = current_user.tasks.where("DATE(date) = ?", params[:date][:date])
				@task += Task.includes(:users).where(users: {id:nil})
			else
				@task = current_user.tasks.where("DATE(date) = ?", Date.today)
				@task += Task.includes(:users).where(users: {id:nil})
			end
		end
		# debugger
	end
	
	def destroy
		if @task.status =! "inprogress" || @task.status =! "done"
			@task.destroy
			flash[:success] = "Task was successfully deletedd"
			redirect_to tasks_path
		else
			redirect_to tasks_path
			flash[:danger] = "Cannot delete task inprogress or done"

		end
	end

	def change_status
		# if current_user.tasks.inprogress.count < 1
		#   @task = Task.find(params[:task])
		#   @task.update(status: params[:status])
		#     if params[:status] == "inprogress"
		# 	  @user = current_user
		# 	  @task.users << @user
		# 	end
		#   redirect_to tasks_path
		#  else
		#  	redirect_to tasks_path
		# 	flash[:danger] = "Complete task you were received before!"
		# end

		if params[:status] == "done"
			@task = Task.find(params[:task])
			@task.update(status: params[:status])
			redirect_to tasks_path
		elsif params[:status] == "inprogress"
			if current_user.tasks.inprogress.count < 1
				@task = Task.find(params[:task])
				@task.update(status: params[:status])
				@user = current_user
				@task.users << @user
				redirect_to tasks_path
			else
				redirect_to tasks_path
				flash[:danger] = "Complete task you were received before!"
			end
		else
			
		end
	end

	private
	def task_params
		params.require(:task).permit(:taskname, :content, :date, :status, user_task_ids: [])
	end
    
	def set_task
		@task = Task.find(params[:id])
	end

	def require_admin_user
			if current_user.admin? == false
				flash[:danger] = "You dont have permission to do this"
				redirect_to tasks_path		
			end
	end

	def remove_images_file
    	@task.images.each do |t|
    		 t.destroy
	    end 
    end

end