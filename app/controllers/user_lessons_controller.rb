class UserLessonsController < ApplicationController

  def create
    @lesson = Lesson.find_by_id(params[:lesson_id])
    @user_lesson = UserLesson.create(user_lesson_params)
    if @user_lesson.save
      flash[:success] = "You rock! Keep up ;)"
   		redirect_to [@lesson.lecture, @lesson.next] 
    else
      flash[:success] = "You have already completed this lesson"
      redirect_to(:back)
    end
  end

  private

  def user_lesson_params 
      params.require(:user_lesson).permit(:user_id, :lesson_id, :completed)
  end


end
