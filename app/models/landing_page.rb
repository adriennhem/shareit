class LandingPage < ActiveRecord::Base
	extend FriendlyId
	friendly_id :permalink, use: :finders

	has_many :subscribers

	# Validations
	validates :permalink, uniqueness: true, presence: true
end
