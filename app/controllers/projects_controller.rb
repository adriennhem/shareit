class ProjectsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_project, except: [:new, :create]
  before_action :lecture_options, only: [:new, :create, :edit]
  before_action :disable_footer
  after_action :verify_authorized
  layout 'dashboard'

  def show
    @offer = Offer.new
    @attachment = Attachment.new 
    @user_attachment = current_user.attachments.where(project_id: @project.id).last
    authorize @project 
  end

  def new
  	@project = Project.new
    authorize @project
  end 

  def edit 
    authorize @project
  end 

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated'  }
      else
        format.html { render :edit }
      end
    end
    authorize @project
  end

  def create 
  	@project = current_user.project_selling.build(project_params)
  	if @project.save 
  		flash[:success] = "You have successfully created a Challenge, a member of our team will review it shortly"
  		redirect_to profile_path(current_user)
  	else 
  		render action: 'new'
  	end
    authorize @project   
  end	

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user), notice: 'Project was successfully deleted' }
    end
      authorize @project
  end

  def complete
    @project.mark_completed!
    redirect_to profile_path
    authorize @project
  end

  private

  def project_params
    params.require(:project).permit(:company_name, :phone_number, :body, :user_id, :title, :lecture_id, :location, :blurb, :deadline, :main_contact_email, :main_contact, :company_description, :industry, :goal, :logo )
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def lecture_options 
    @lecture_options = Lecture.all.map{|u| [u.title, u.id]}
  end
end

