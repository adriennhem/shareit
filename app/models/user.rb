class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:student, :company]
  after_initialize :set_default_role, :if => :new_record?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :email, uniqueness: true
  validates_format_of :email, with: /\@grenoble-em\.com/, message: 'You should have an email from grenoble-em.com', if: ->(user) { user.role == 'student' }
  validates :role, presence: true

  # User / lecture relationship
  has_many :enrollments
  has_many :user_lessons
  has_many :lectures, through: :enrollments

  accepts_nested_attributes_for :enrollments



def set_default_role
  self.role ||= :student
end


end
