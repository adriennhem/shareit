class OfferPolicy < ApplicationPolicy

	def create?
		user.student?
	end


	 class Scope < Scope
	    def resolve
	        scope.where(:role == 'student')
	    end
	  end

end