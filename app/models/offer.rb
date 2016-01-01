class Offer < ActiveRecord::Base
	belongs_to :project
	belongs_to :buyer, class_name: 'User', foreign_key: :user_id
	has_one :seller, class_name: 'User', through: :project
	validates :project_id, uniqueness: true
end
