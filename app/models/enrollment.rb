class Enrollment < ActiveRecord::Base
	belongs_to :user 
	belongs_to :lecture

	validates :lecture, uniqueness: { scope: :user, message: "should happen once per user" }
end
