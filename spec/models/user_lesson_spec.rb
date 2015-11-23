require 'rails_helper'

RSpec.describe UserLesson, type: :model do
	it "is valid with user_id and lesson_id" do
		user_lesson = UserLesson.new(
			user_id: 1,
			lesson_id:2)
		user_lesson.valid?
		expect(user_lesson).to be_valid
	end

	it "is invalid without user_id" do
		 user_lesson = UserLesson.new(
				user_id: nil,
				lesson_id:2)
			user_lesson.valid?
			expect(user_lesson.errors[:user_id]).to include("can't be blank")
	end 

	it "is invalid without lesson_id" do
	 user_lesson = UserLesson.new(
			user_id: 1,
			lesson_id: nil)
		user_lesson.valid?
		expect(user_lesson.errors[:lesson_id]).to include("can't be blank")
	end 

	it "cannot be a duplicate" do 
		user_lesson = UserLesson.create(
			user_id: 1,
			lesson_id: 2)
		user_lesson_duplicate = UserLesson.new(
			user_id: 1,
			lesson_id: 2)
		user_lesson_duplicate.valid?
		expect(user_lesson_duplicate).not_to be_valid

	end
end
