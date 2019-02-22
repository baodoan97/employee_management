class TasksController < ApplicationController
	before_action :set_task, only: [:edit, :update, :show, :destroy]
	before_action :remove_images_file, only: [:destroy]
	before_action :require_user
	before_action :require_admin_user, only: [:edit, :update, :destroy]
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
		
		# @task.users << @user
		# @task.taskname = task_params[:taskname]
		# @task.content = task_params[:content]
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
            	
        	   i = 0
		       while (i < task_params[:photo].count) do
		          @image = Image.new
				  @image.task = @task
				  @image.pictrue = task_params[:photo][i]
				  @image.save
				  i = i + 1
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
             }
		if @task.update(paTASK)   
            j=1
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
            
			if task_params[:photo] != nil
			 i = 0
		       while (i < task_params[:photo].count) do
		          @image = Image.new
				  @image.task = @task
				  @image.pictrue = task_params[:photo][i]
				  @image.save
				  i = i + 1
		       end
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
		i = 0
		while i < params[:delete][:image_ids].count do
			begin  
             u = Image.find(params[:delete][:image_ids][i].to_i)
             u.destroy
            rescue 

            end  
             i = i + 1  
		end
		# @task = Task.find(params[:task][:task_id][0].to_i)
		redirect_to edit_task_path($s)
	end

	def index
		if current_user.admin?
			@task = Task.all
		else
			@task = current_user.tasks
		end
	end

	def destroy
		@task.destroy
		flash[:success] = "Task was successfully deletedd"
		redirect_to tasks_path
	end
	private
	def task_params
		params.require(:task).permit(:taskname, :content, :date, photo: [], user_task_ids: [])
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