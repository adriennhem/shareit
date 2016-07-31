class Lesson < ActiveRecord::Base
	has_one :lecture, through: :chapter
	belongs_to :chapter
	has_many :user_lessons
	has_many :users, through: :user_lessons

	validates :etape, uniqueness: true

	def next
    	self.class.where("etape > ?", etape).order(etape: :asc).first
  	end

	def previous
   		self.class.where("etape < ?", etape).order(etape: :asc).last
 	end
end
