class User < ActiveRecord::Base
  after_create :notify_slack
  devise :timeoutable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: {student: 1, company: 2, author: 3}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "https://s3-us-west-2.amazonaws.com/workshopr-picture/assets/pictures/missing.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :email, uniqueness: true
  # validates_format_of :email, with: /\@grenoble-em\.com/, message: "You should have an email from grenoble-em.com", if: ->(user) { user.role == 'student' }
  validates :role, presence: true

  # Relationship Posts
  has_many :posts 

  # User / lecture relationship
  has_many :enrollments
  has_many :user_lessons
  has_many :lectures, through: :enrollments

  has_many :project_selling, class_name: 'Project'
  has_many :offers_received, class_name: 'Offer',
         through: :projects_selling, source: :offers

  has_many :offers_made, class_name: 'Offer'
  has_many :project_buying, class_name: 'Project',
         through: :offers_made, source: :project

  has_many :attachments


  accepts_nested_attributes_for :enrollments

  def notify_slack
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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", channel: '#general',
                                              username: 'Workshopr Dean'
    if self.role == "student"
      notifier.ping "#You have a new student: #{self.email}"
    else
      notifier.ping "#You have a new company: #{self.email}"  
    end
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def is_admin  
    self.admin?
  end

  def made_offer?(project)
    self.offers_made.include?(project)
  end

  def latest_completed_lesson
    self.user_lessons.order(created_at: :desc).first
  end
end
