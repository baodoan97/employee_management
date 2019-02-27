class Task < ApplicationRecord
	has_many  :images
	has_many :user_tasks
	has_many :users, through: :user_tasks
	validates :taskname, presence: true, length: {minimum: 3, maximum: 50}
	validates :content, presence: true, length: {minimum: 10, maximum: 300}
	enum status: {
		notstarted: 0,
		inprogress: 1,
		done: 2
	}
end