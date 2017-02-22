class LandingPagesController < ApplicationController
	def show
		@disable_footer = true 
		@disable_navbar = true 
		@landing_page = LandingPage.friendly.find(params[:id])
		@subscriber = Subscriber.new
	end 
end
