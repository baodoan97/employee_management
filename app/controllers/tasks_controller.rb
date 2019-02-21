class TasksController < ApplicationController
	before_action :set_task, only: [:edit, :update, :show, :destroy]
	def new
		@task = Task.new
	end

	def create
		@task = Task.new
		@task.taskname = task_params[:taskname]
		@task.content = task_params[:content]
        if @task.save
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
		if @task.update(task_params)
			flash[:success] = "Task was updated"
			redirect_to task_path(@task)
		else
			render 'edit'
		end
	end

	def show
		
	end

	def index
		@task = Task.all
	end

	def destroy
		@task.destroy
		flash[:success] = "Task was successfully deletedd"
		redirect_to tasks_path
	end
	private
	def task_params
		params.require(:task).permit(:taskname, :content,photo: [])
	end

	def set_task
		@task = Task.find(params[:id])
	end

end