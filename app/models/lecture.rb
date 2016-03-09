 class Lecture < ActiveRecord::Base
   extend FriendlyId
   friendly_id :permalink, use: :finders

	belongs_to :category
	belongs_to :teacher

	has_many :outlines
	has_many :chapters
	has_many :lessons, through: :chapters, dependent: :destroy 
	accepts_nested_attributes_for :chapters

	# For course user relationship 
	has_many :enrollments 
	has_many :users, through: :enrollments
	accepts_nested_attributes_for :enrollments

	# Related to project
	has_many :projects

	# Validations
	validates :permalink, uniqueness: true

	# attributes
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  	scope :published, -> { where(published: true) }
  	
	def percent_completed_by(user)
      uncompleted_lessons_in_course = self.lessons - user.user_lessons
      100 * ( uncompleted_lessons_in_course.count.to_f / self.lessons.count.to_f)
    end
    
end
