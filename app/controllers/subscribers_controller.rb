class SubscribersController < ApplicationController
	
	def create
	  @subscriber = Subscriber.create(subscriber_params)
	  respond_to do |format| 
	    if @subscriber.save
	   	  format.js { flash[:success] = "You have joined the waiting list" }
	    else
	      format.js { flash[:error] = "The email address is either invalid or already registered" }
	    end
	  end
	end

	private

	def subscriber_params
	  params.require(:subscriber).permit(:email, :landing_page_id)
	end
end
