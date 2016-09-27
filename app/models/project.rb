class Project < ActiveRecord::Base
	belongs_to :lecture
	belongs_to :seller, class_name: 'User', foreign_key: :user_id
	has_many :offers, dependent: :destroy
	has_many :buyers, class_name: 'User', through: :offers
	has_many :attachments

	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

	scope :no_offer, ->  { includes(:offers).where( :offers => { :project_id => nil } ) }
	scope :approved, -> { where(approved: true) }
	
	validates :company_description, length: { maximum: 250 }
	validates_presence_of :company_name, :body, :user_id, :title, :blurb, :location, :industry, :company_description, :goal, :main_contact, :main_contact_email

	def mark_completed!
 	 self.update_attribute(:completed, true)
	end
end
