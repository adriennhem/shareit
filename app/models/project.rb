class Project < ActiveRecord::Base
	belongs_to :lecture
	belongs_to :seller, class_name: 'User', foreign_key: :user_id
	has_many :offers
	has_many :buyers, class_name: 'User', through: :offers

	scope :no_offer, ->  { includes(:offers).where( :offers => { :project_id => nil } ) }

	
end
