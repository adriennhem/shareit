class PagesController < ApplicationController
  def home
  	@lectures = Lecture.all
  end

  def about
  end

  def contact
  end

  def upcoming
  end


  def blog
  	@posts = Post.all
  end

end
