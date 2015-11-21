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
	  record.user_id == user.id || !scope.includes(:offers).exists? || scope.includes(:offers).where(offers: {user_id: user.id})
	end

	def destroy?
		record.user_id == user.id
	end



end