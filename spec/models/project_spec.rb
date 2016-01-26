require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is valid with all attributes" do 
  	project = Project.new(
  		company_name: 'xx',
  		company_description: 'xx',
  		body: 'xx',
  		user_id: 1, 
  		title: 'xx', 
  		lecture_id: 1, 
  		blurb: 'xx',
  		location: 'london',
  		industry: 'Agency',
  		company_description: 'xx',
  		goal: 'xx',
  		main_contact: 'hello',
  		main_contact_email: 'adrien'
  		 )
  	project.valid?
  	expect(project).to be_valid 
  end


end
