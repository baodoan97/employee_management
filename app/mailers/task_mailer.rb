class TaskMailer < ApplicationMailer
 
	  def new_task(user)
	    @user = user
	    mail(to: @user.email, subject: 'Vinova | You have a new task to be done')
	  end

end
