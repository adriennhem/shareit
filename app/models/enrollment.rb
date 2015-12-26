class Enrollment < ActiveRecord::Base
  belongs_to :user 
  belongs_to :lecture
  validates :user_id, presence: true
  validates :lecture_id, presence: true 
  validates :lecture, uniqueness: { scope: :user, message: "should happen once per user" }
end
