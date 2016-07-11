class LandingPage < ActiveRecord::Base
	extend FriendlyId
	friendly_id :permalink, use: :finders

	# Validations
	validates :permalink, uniqueness: true, presence: true
end
