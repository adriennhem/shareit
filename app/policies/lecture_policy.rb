class LecturePolicy < ApplicationPolicy
	def index?
		true
	end

	def show?
		user.enrollments.where(lecture_id: record.id).exists?
	end

	def lecture_description
		true
	end
end