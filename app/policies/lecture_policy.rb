class LecturePolicy < ApplicationPolicy
	def index?
		true
	end

	def create?
		false
	end

	def update?
		false
	end

	def edit?
		false
	end

	 class Scope < Scope
	    def resolve
	        scope.where(:id => user.enrollments.select(:lecture_id))
	    end
	  end

end