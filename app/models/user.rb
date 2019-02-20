class User < ApplicationRecord
has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
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
end