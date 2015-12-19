require 'rails_helper'

RSpec.describe BlogCategory, type: :model do
  
  it "is invalid without a title" do 
  	blog_category = BlogCategory.new(title: nil)
  	blog_category.valid?
  	expect(blog_category.errors[:title]).to include("can't be blank")
  end 
end
