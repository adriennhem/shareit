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

<<<<<<< HEAD
  def blog
  	@posts = Post.all
  end
=======
>>>>>>> blog
end
