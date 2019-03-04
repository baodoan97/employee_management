class User < ApplicationRecord
has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
has_many :user_tasks
#belongs_to :admins
has_many :tasks, through: :user_tasks
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
validates :username, presence: true,
uniqueness: true,
length: {minimum: 3, maximum: 25}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, 	 presence: true,
length: {maximum: 105},
uniqueness: true,
format: {with: VALID_EMAIL_REGEX }
has_secure_password

 def self.to_csv
   attributes = %w{ id username email avatar password_digest admin }
CSV.generate(headers: true) do |csv|
  csv << attributes
  all.each do |user|
    csv << attributes.map{ |attr| user.send(attr)}
      end
    end
  end
end
