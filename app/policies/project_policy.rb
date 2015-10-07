class ProjectPolicy < ApplicationPolicy
	def index?
		true
	end

	def new?
		@user.company?
	end

	def create?
		@user.company?
	end

	def update?
		true
	end

	def edit?
		true
	end

	def show?
		@user.company?
	end

	def destroy?
		true
	end

end