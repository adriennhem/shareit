class UserLesson < ActiveRecord::Base
  after_create :intercom_completed_lesson	
  # This is the join table allowing the students to mark a lesson completed
  belongs_to :user 
  belongs_to :lesson

  validates :lesson_id, :uniqueness => {:scope=>:user_id}
  validates :user_id, presence: true
  validates :lesson_id, presence: true

  protected

  def intercom_completed_lesson
  	$intercom.events.create(
  	  :event_name => "Completed lesson", :created_at => Time.now.to_i,
  	  :email => user.email,
  	  :metadata => {
  	  	"course" => self.lesson.chapter.lecture.title,
  	  	"lesson" => self.lesson.title,
  	  	"step"   => self.lesson.etape	
  	  }
  	)
  end
end
