class LecturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :lecture_description]
  before_action :set_lecture, only: [:show]
  after_action :verify_authorized
  layout 'dashboard', except: [:lecture_description]

  # GET /lectures
  # GET /lectures.json
  def index
    if current_user.admin?
      @lectures = Lecture.all
    else 
      @lectures = Lecture.published
    end
    authorize @lectures
    @disable_footer = true
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @projects = Project.where(lecture_id: @lecture.id).no_offer.approved
    @teacher = Teacher.all
    authorize @lecture
    @disable_footer = true
  end

  def lecture_description
    @lecture = Lecture.friendly.find(params[:id]) 
    skip_authorization
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lectures.new(lecture_params)
    @lecture.teacher_id = params[:teacher_id]
    @lecture.category_id = params[:category_id]
    authorize @lecture
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
    authorize @lecture
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:title, :description, :category_id, :picture, :teacher_id, :video, :enrollment_id, :learning_outcomes, :long_description, :teacher_description, :background_image, :permalink, :approved)
    end
end
