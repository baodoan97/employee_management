class TasksController < ApplicationController
	before_action :set_task, only: [:edit, :update, :show]
	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			flash[:success] = "Task was created successfully"
			redirect_to task_path(@user)
	end

	def edit

	end

	def update
		if @task.update(task_params)
			flash[:success] = "Task was updated"
			redirect_to tasks_path
	end

	def show
		
	end

	def index

	end

	def destroy

	end
	private
	def task_params
		params.require(:task).permit(:taskname)
	end

	def set_task
		@task = Task.find(params[:id])
	end

end