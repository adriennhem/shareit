class OfferPolicy < ApplicationPolicy

	def create?
		is_student?
	end

end