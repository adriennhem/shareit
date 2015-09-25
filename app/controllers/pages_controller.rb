class PagesController < ApplicationController
  def home
  	@lecture = Lecture.first
  end

  def about
  end

  def contact
  end

  def upcoming
  end

  def signout
    render layout: 'devise_layout'
  end

  def blog
  	@posts = Post.all
  end

end
