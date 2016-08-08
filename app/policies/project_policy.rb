class ProjectPolicy < ApplicationPolicy
	def index?
		false
	end

	def new?
		is_company?
	end

	def create?
		is_company?
	end

	def update?
		is_owner?
	end

	def complete?
		is_owner?
	end

	def edit?
		is_owner? && !record.approved
	end

	def show?
	  is_owner? || !scope.includes(:offers).exists? || scope.includes(:offers).where(offers: {user_id: user.id})
	end

	def destroy?
		is_owner?
	end



end