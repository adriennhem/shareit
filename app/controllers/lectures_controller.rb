class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

  # GET /lectures
  # GET /lectures.json
  def index
    if params[:category]
      @category_id = Category.find_by(name: params[:category]).id
      @lectures = Lecture.where(category_id: @category_id).order("created_at DESC")
    else
      @lectures = Lecture.all
    end
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @teacher = Teacher.all
    @lessons = Lesson.where(lecture_id: @lecture.id).order(:etape)
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    @teachers - Teacher.all.map{|d| [ d.name, d.id ] }
  end

  # GET /lectures/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    @teachers - Teacher.all.map{|d| [ d.name, d.id ] }
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lectures.new(lecture_params)
    @lecture.teacher_id = params[:teacher_id]
    @lecture.category_id = params[:category_id]
    if @lecture.save
      redirect_to @lecture, notice: 'Lecture was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    @lecture.category_id = params[:category_id]
    @lecture.teacher_id = params[:teacher_id]
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:title, :description, :category_id, :picture, :teacher_id, :video)
    end
end
