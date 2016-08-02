class LessonPolicy < ApplicationPolicy
	def show?
		user.enrollments.where(lecture_id: @record.chapter.lecture_id).exists?
	end
end