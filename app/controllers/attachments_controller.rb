class AttachmentsController < ApplicationController
	def create
		@attachment = Attachment.create(attachment_params)
		if @attachment.save
			redirect_to :back, notice: 'You have successfully submitted your work. High Five'
		else
			redirect_to :back, notice: 'Please try to submit again'
		end
	end

	def update 
	end

	def destroy 
		@attachment = Attachment.find(params[:id])
		@attachment.destroy
		redirect_to :back
	end

	def attachment_params
	    params.require(:attachment).permit(:project_id, :user_id, :document)
	end
end
