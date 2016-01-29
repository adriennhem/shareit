class PagesController < ApplicationController
  def home
  	@lecture = Lecture.first
    @disable_newsletter = true
  end

  def home_company
  
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

  def rules
  end

  def help_center
  end

end
