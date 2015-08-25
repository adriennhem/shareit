class UserLesson < ActiveRecord::Base
	belongs_to :user 
	belongs_to :lesson
	validates :lesson_id, :uniqueness => {:scope=>:user_id}
	# validates_uniqueness_of :lesson_id, :scope => [:user_lesson_id]
	# validates_uniqueness_of :user_lesson, scope: :user_lesson_id
end
