class UserLesson < ActiveRecord::Base
	belongs_to :user 
	belongs_to :lesson
	validates :lesson_id, :uniqueness => {:scope=>:user_id}


	def self.total 
		self.sum(:completed)
	end
end
