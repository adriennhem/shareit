class PagesController < ApplicationController
  def home
  	@lecture = Lecture.last
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
