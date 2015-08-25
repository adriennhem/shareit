class LessonsController < ApplicationController
  load_and_authorize_resource 
  before_action :authenticate_user!, only: :show  

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lecture = Lecture.find(params[:lecture_id])
    @lesson = @lecture.lessons.find(params[:id])
    # @previous = @lecture.lessons.where("id < ?", params[:id]).order(:id).first   
    # @next = @lecture.lessons.where("id > ?", params[:id]).order(:id).first 
  end

  # GET /lessons/new
  def new
    @lecture = Lecture.find(params[:lecture_id])
    @lesson = Lesson.new

  end

  # GET /lessons/1/edit
  def edit
    @lecture = Lecture.find(params[:lecture_id])
    @lesson = @lecture.lessons.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = @chapter.lessons.build(params[:lesson].permit(:title, :description, :vid, :etape, :chapter_id))
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
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @lesson = @lecture.lessons.find(params[:id])
    @lesson.destroy

    redirect_to lecture_path(@lecture)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :description, :vid, :etape)
    end
end
end
