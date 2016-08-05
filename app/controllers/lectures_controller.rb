class LecturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :lecture_description]
  before_action :disable_footer, except: [:lecture_description]
  before_action :set_lecture, except: [:index]
  after_action :verify_authorized, except: [:lecture_description]
  layout 'dashboard', except: [:lecture_description]


  def index
    if current_user.admin?
      @lectures = Lecture.all
    else 
      @lectures = Lecture.published.order(created_at: :asc)
    end
    authorize @lectures
  end


  def show
    @chapters = @lecture.chapters.includes(:lessons)
    @projects = @lecture.projects.no_offer.approved
    authorize @lecture
  end

  def lecture_description
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.friendly.find(params[:id]) 
    end

end
