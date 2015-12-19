require 'rails_helper'

RSpec.describe Post, type: :model do

  it "is invalid without a title" do
  	post = Post.new(
  		title: nil,
  		content: 'hello')
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a content" do 
  	post = Post.new(
  		title: 'hello',
  		content: nil)
  	post.valid?
  	expect(post.errors[:content]).to include("can't be blank")
  end



end
