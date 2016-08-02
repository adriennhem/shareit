class PostPolicy < ApplicationPolicy

	def show?
		record.published? || !user.nil? && user.admin?
	end


	class Scope < Scope
	    def resolve
	      if !user.nil? && user.admin?
	        scope.all
	      else
	        scope.where(published: true)
	      end
	    end
	end
end