class Lesson < ActiveRecord::Base
	has_one :lecture, through: :chapter
	belongs_to :chapter
	has_many :user_lessons
	has_many :users, through: :user_lessons

	validates :etape, uniqueness: true

	def next
    	self.class.where("id > ?", self.id).where("etape > ?", etape).first
  	end

	def previous
   		self.class.where("id > ?", self.id).where("etape < ?", etape).last
 	end
end
