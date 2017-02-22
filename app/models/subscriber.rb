class Subscriber < ActiveRecord::Base
	validates :email, presence: true
	validates :email, uniqueness: { message: "The address is already registered" }  
	# validates :email, format: { with:  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
	belongs_to :landing_page
end
