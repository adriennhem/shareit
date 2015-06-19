class Lecture < ActiveRecord::Base
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	

	belongs_to :category
	has_many :lessons, dependent: :destroy 
	belongs_to :teacher

	# For course user relationship 
	has_many :enrollments 
	has_many :users, through: :enrollments

	accepts_nested_attributes_for :lessons
	 accepts_nested_attributes_for :enrollments
end
