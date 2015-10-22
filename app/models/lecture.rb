 class Lecture < ActiveRecord::Base
	belongs_to :category
	has_many :lessons, through: :chapters, dependent: :destroy 
	has_many :chapters
	belongs_to :teacher

	# For course user relationship 
	has_many :enrollments 
	has_many :users, through: :enrollments
	has_many :projects

	accepts_nested_attributes_for :enrollments
	accepts_nested_attributes_for :chapters

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	
end
