class User < ApplicationRecord
	has_one_attached :avatar
   
has_many :user_tasks
has_many :tasks, through: :user_tasks
validates :username, presence: true,
uniqueness: true,
length: {minimum: 3, maximum: 25}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, 	 presence: true,
length: {maximum: 105},
uniqueness: true,
format: {with: VALID_EMAIL_REGEX }
has_secure_password


has_many :comments

end