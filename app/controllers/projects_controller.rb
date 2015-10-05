class ProjectsController < InheritedResources::Base
  before_action :authenticate_user!
  after_action :verify_authorized


  def index
    @projects = Project.all
  end


  def show
    @project = Project.find(params[:id])
  	respond_to do |format|
  		format.html
  		format.js
  	end
    authorize @project
  end

  def new
  	@project = Project.new
  	respond_to do |format|
  		format.html
  		format.js
  	end
    authorize @project
  end 

  def edit 
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end 

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

def create 
	@project = current_user.projects.build(project_params)
	if @project.save 
		flash[:success] = "You have successfully created a project."
		redirect_to profile_path(current_user)
	else 
		render action: 'new'
	end
  authorize @project 
end	

def destroy
    @project.destroy(params[:id])
    redirect_to profile_path(current_user)
end


  private

    def project_params
      params.require(:project).permit(:company_name, :phone_number, :body, :user_id, :title)
    end
end

