class ProjectPolicy < ApplicationPolicy
	def index?
		false
	end

	def new?
		@user.company?
	end

	def create?
		@user.company?
	end

	def update?
		record.user_id == user.id
	end

	def edit?
		record.user_id == user.id
	end

	def show?
	  true
	end

	def destroy?
		record.user_id == user.id
	end

	class Scope < Scope
	    def resolve
	        scope.where(record.user_id == user.id)
	    end
	  end


end