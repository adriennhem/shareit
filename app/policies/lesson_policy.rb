class LessonPolicy < ApplicationPolicy
	def create?
		false
	end

	def update?
		false
	end

	def show?
		# lesson.lecture_id == lecture.id or LecturePolicy.new(lecture, Lecture.find(lesson.lecture.id)).show?
	end


	def edit?
		false
	end
end