class Lesson < ActiveRecord::Base
	extend FriendlyId
    friendly_id :title, use: :finders

	has_one :lecture, through: :chapter
	belongs_to :chapter
	has_many :user_lessons
	has_many :users, through: :user_lessons

	# validates :etape, uniqueness: { scope: :lecture_id }


	def next
    	self.class.where("etape > ?", etape).order(etape: :asc).first
  	end

	def previous
   		self.class.where("etape < ?", etape).order(etape: :asc).last
 	end

 	def is_complete?(user)
 		user_lessons.exists?(user_id: user.id, lesson_id: self.id)
 	end
end
