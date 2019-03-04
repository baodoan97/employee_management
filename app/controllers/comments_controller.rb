class CommentsController < ApplicationController
	def new
         @comment = Comment.new
	end
	def create
		   # debugger
		   @comment = Comment.new
	       @comment.content = params[:comment][:content]
	       @comment.user = current_user
	       @comment.save
	       @task = Task.find(params[:task][:task_id])
	       @task.comments << @comment
	       @task.save
	       respond_to do |format|
	       	format.html 
	       	format.js
	       end
	       # debugger
	       # respond_to(:js)
	end
end