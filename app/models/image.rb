class Image < ApplicationRecord
	belongs_to :task
	validates :task_id,presence: true
	has_attached_file :pictrue, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :pictrue, content_type: /\Aimage\/.*\z/
    # validates_attachment :pictrue, :presence => true,:content_type => { :content_type => "image/jpg" },:size => { :in => 0..10.kilobytes }
    # validates_format_of :pictrue, :with => %r{\.(png|jpg|jpeg)$}i, :message => "whatever"
end