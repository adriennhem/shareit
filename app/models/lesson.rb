class Lesson < ActiveRecord::Base
	has_one :lecture, through: :chapter
	belongs_to :chapter 
	has_many :user_lessons
end
