class LessonsController < ApplicationController 
  before_action :authenticate_user!, only: :show  
  layout 'dashboard'
  
  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lecture = Lecture.find(params[:lecture_id])
    @lesson = @lecture.lessons.find(params[:id])
    @disable_footer = true
    authorize @lecture
    
    # @previous = @lecture.lessons.where("id < ?", params[:id]).order(:id).first   
    # @next = @lecture.lessons.where("id > ?", params[:id]).order(:id).first 
  end

  # POST /lessons.json
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = @chapter.lessons.build(params[:lesson].permit(:title, :description, :vid, :etape, :chapter_id,  :short_description, :video_duration))
    if @lesson.save
    redirect_to lecture_path(@lecture)
  else 
    redirect_to new_lecture_path
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :description, :vid, :etape, :short_description, :video_duration)
    end
end
end
