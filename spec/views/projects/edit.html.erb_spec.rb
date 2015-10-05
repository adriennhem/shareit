require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :company_name => "MyString",
      :phone_number => "MyString",
      :body => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_company_name[name=?]", "project[company_name]"

      assert_select "input#project_phone_number[name=?]", "project[phone_number]"

      assert_select "textarea#project_body[name=?]", "project[body]"

      assert_select "input#project_user_id[name=?]", "project[user_id]"
    end
  end
end
