class ProjectsController < InheritedResources::Base
  before_action :authenticate_user!
  after_action :verify_authorized
  layout 'dashboard'


  def index
    @projects = Project.all
    authorize @projects
    @disable_footer = true
  end


  def show
    @project = Project.find(params[:id])
    @offer = @project.offers.all
    authorize @project 
    @disable_footer = true
  end

  def new
    @lecture_options = Lecture.all.map{|u| [u.title, u.id]}
  	@project = Project.new
    @maximum_length = Project.validators_on( :company_description ).first.options[:maximum]
    authorize @project
    @disable_footer = true
  end 

  def complete
    project = Project.find(params[:id])
    project.complete
    redirect_to project
    authorize project
  end

  def edit 
    @lecture_options = Lecture.all.map{|u| [u.title, u.id]}
    @project = Project.find(params[:id])
    authorize @project
    @disable_footer = true
  end 

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated'  }
      else
        format.html { render :edit }
      end
    end
    authorize @project
    @disable_footer = true
  end

def create 
  @lecture_options = Lecture.all.map{|u| [u.title, u.id]}
	@project = current_user.project_selling.build(project_params)
	if @project.save 
		flash[:success] = "You have successfully created a project"
		redirect_to profile_path(current_user)
	else 
		render action: 'new'
	end
  authorize @project 
  
end	

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user), notice: 'Project was successfully deleted' }
      format.js { head :no_content }
    end
    authorize @project
  end

  private

    def project_params
      params.require(:project).permit(:company_name, :phone_number, :body, :user_id, :title, :lecture_id, :location, :blurb)
    end
end

