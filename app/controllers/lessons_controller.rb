class LessonsController < ApplicationController 
  before_action :set_lesson
  before_action :disable_footer
  before_action :authenticate_user!, only: :show  
  layout 'dashboard'
  
  def show
    authorize @lesson 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.friendly.find(params[:id])
    end

end
