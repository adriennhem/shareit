require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :company_name => "Company Name",
        :phone_number => "Phone Number",
        :body => "MyText",
        :user_id => 1
      ),
      Project.create!(
        :company_name => "Company Name",
        :phone_number => "Phone Number",
        :body => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
