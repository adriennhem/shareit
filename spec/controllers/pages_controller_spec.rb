require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

	describe "Route for Home" do
		it 'routes /pages to the pages controller ' do
			expect(get: "/").to route_to(controller: "pages", action: "home")
		end
	end 

	describe "routes for about" do
		it 'routes /about to the pages controller' do
			expect(get: "/about").to route_to(controller: "pages", action: "about")
		end
	end
end
