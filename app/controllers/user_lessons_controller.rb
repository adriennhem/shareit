class UserLessonsController < ApplicationController

  def show
  end 

  def create
    @user_lesson = UserLesson.create(user_lesson_params)
    if @user_lesson.save
      flash[:success] = "You rock! Keep up ;)"
   		redirect_to(:back)
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
