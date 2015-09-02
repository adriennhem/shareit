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
  end

  def blog
  	@posts = Post.all
  end

end
