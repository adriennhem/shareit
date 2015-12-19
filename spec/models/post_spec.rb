require 'rails_helper'

RSpec.describe Post, type: :model do

  it "is invalid without a title" do
  	post = Post.new(
  		title: nil,
  		content: 'hello',
      blog_category_id: 1,
      published: false)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a content" do 
  	post = Post.new(
  		title: 'hello',
  		content: nil,
      blog_category_id: 1,
      published: false)
  	post.valid?
  	expect(post.errors[:content]).to include("can't be blank")
  end

  it "is invalid without a blog category" do 
    post = Post.new(
      title: 'hello',
      content: 'hello',
      blog_category_id: nil,
      published: false)
    post.valid?
    expect(post.errors[:blog_category_id]).to include("can't be blank")
  end

  it "is invalid without a published status" do 
    post = Post.new(
      title: 'hello',
      content: 'hello',
      blog_category_id: 1,
      published: nil)
    post.valid?
    expect(post.errors[:published]).to include("can't be blank")
  end 



end
