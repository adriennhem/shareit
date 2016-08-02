class PagesController < ApplicationController
  def home
  	@lecture = Lecture.last
    @disable_newsletter = true
  end

  def home_company
  end

  def about
  end

  def contact
  end
end
