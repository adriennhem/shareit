class PostPolicy < ApplicationPolicy

	def show?
		record.published?
	end


	class Scope < Scope
	    def resolve
	      if !user.nil? && user.admin?
	        scope.all
	    	else
	        scope.where(:published => true)
		    end
	      else
	      scope.where(:published => true)
	    end
		end



end