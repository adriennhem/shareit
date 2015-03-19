class Lecture < ActiveRecord::Base
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	belongs_to :category
	belongs_to :user
	validates :picture, presence: true
	validates :title, presence: true
	validates :description, presence: true
end
