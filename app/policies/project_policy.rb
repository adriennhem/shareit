class ProjectPolicy < ApplicationPolicy
	def new?
		@user.company?
	end

	def create?
		@user.company?
	end

	def update?
		false
	end

	def show?
		@user.company?
	end
end