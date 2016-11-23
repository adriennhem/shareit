class PagesController < ApplicationController
  after_action :intercom_shutdown, only: [:home]

  def home
  	@lecture = Lecture.last
  end

  def home_company
  end

  def about
  end

  def contact
  end

  protected

  def intercom_shutdown
  	IntercomRails::ShutdownHelper.intercom_shutdown(session, cookies)
  end
end
