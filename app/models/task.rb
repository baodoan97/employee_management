class Task < ApplicationRecord
	# has_many  :images
	has_many_attached :images
	has_many :user_tasks
	has_many :users, through: :user_tasks
	validates :taskname, presence: true, length: {minimum: 10, maximum: 300}
	validates :content, presence: true, length: {minimum: 10, maximum: 300}
	enum status: {
		notstarted: 0,
		inprogress: 1,
		done: 2
	}


	enum level: {
		low: 0,
		normal: 1,
		high: 2,
		highest: 3
	}
	has_many :comments
	validate :content_type
	 private
	 
     	 def content_type
     	 	i = 0
	    self.images.each{ |image|
             if image.content_type != "image/png" && image.content_type != "image/jpeg"
                self.images[i].destroy
                return
             end  
             i = i + 1
	    }
	   
       end

end