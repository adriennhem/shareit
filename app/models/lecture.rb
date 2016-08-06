 class Lecture < ActiveRecord::Base
   extend FriendlyId
   friendly_id :permalink, use: :finders

	belongs_to :category
	belongs_to :teacher

	has_many :outlines
	has_many :chapters, dependent: :destroy
	has_many :lessons, through: :chapters
	accepts_nested_attributes_for :chapters, allow_destroy: true

	# For course user relationship 
	has_many :enrollments 
	has_many :users, through: :enrollments
	accepts_nested_attributes_for :enrollments

	# Related to project
	has_many :projects

	# Validations
	validates :permalink, uniqueness: true

	# attributes
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "https://s3-us-west-2.amazonaws.com/workshopr-picture/assets/pictures/missing.jpg"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  	scope :published, -> { where(published: true) }
  	
	def percent_completed_by(user)
      uncompleted_lessons_in_course = self.lessons - user.user_lessons
      100 * ( uncompleted_lessons_in_course.count.to_f / self.lessons.count.to_f)
    end

    def lecture_is_complete?(user)
    	total_completed_lessons = lessons.includes(:user_lessons).where('user_id = ?', user.id).references(:user_lessons)
    	lessons.count == total_completed_lessons.count 

    end
end
