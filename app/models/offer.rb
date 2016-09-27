class Offer < ActiveRecord::Base
	before_destroy :destroy_attachments

	# before_create :check_offer_limit!
	# after_create push the remaining seats. 

	belongs_to :project
	belongs_to :buyer, class_name: 'User', foreign_key: :user_id

	has_one :seller, class_name: 'User', through: :project

	validates :project_id, uniqueness: true

	private

	def destroy_attachments
		Attachment.where(user_id: self.user_id, project_id: self.project_id).delete_all
	end

	# Infinity = 1.0/0

	# def remaining_seats #=> Number
	# 	return Infinity if project.seat_limit <= 0

	# 	project.seat_limit - Offer.where(project: project).count
	# end

	# def reached_offer_limit? 
	# 	remaining_seats > 0
	# end

	# # TODO: Make sure it's executed inside the transaction
	# def check_offer_limit!
	# 	raise "Oops, too many users!" if reached_offer_limit?
	# end

end
