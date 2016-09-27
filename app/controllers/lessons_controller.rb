class LessonsController < ApplicationController 
  layout 'dashboard'
  before_action :set_lesson
  before_action :disable_footer
  before_action :disable_navbar 
  before_action :authenticate_user!, only: :show  
  
  def show
    authorize @lesson 
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lecture = Lecture.find(params[:lecture_id])
      # can't find lesson if there is whitespace. 
      @lesson = @lecture.lessons.friendly.find(params[:id])
    end
end
