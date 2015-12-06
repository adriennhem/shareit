class OffersController < ApplicationController
	def create

    @project = Project.find(params[:project_id])
    @seller = User.find_by(id: @project.user_id)
    @offer = @project.offers.create(offer_params)
    @offer.user_id = current_user.id
    @buyer = current_user
    authorize @offer
    if @offer.save
        AcceptMailer.accept(@seller, @project, @buyer).deliver
        redirect_to @project, notice: 'Project accepted!'
    else
        redirect_to :back, notice: 'Only one student per project'
    end
end

def accept
    offer = current_user.offers_received.find(params[:id])
    offer.accept
end

def reject
    offer = current_user.offers_received.find(params[:id])
    offer.reject
end

def destroy
    @project = Project.find(params[:project_id])
    @offer = @project.offers.where(project_id: @project.id)
    @offer.destroy_all
    redirect_to @project, :notice => "Offer Deleted"
end

private

def offer_params
    params.require(:offer).permit(:project_id, :user_id)
end
end

