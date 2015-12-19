class UserLesson < ActiveRecord::Base
  # This is the join table allowing the students to mark a lesson completed
  belongs_to :user 
  belongs_to :lesson
  validates :lesson_id, :uniqueness => {:scope=>:user_id}
  validates :user_id, presence: true
  validates :lesson_id, presence: true
end
