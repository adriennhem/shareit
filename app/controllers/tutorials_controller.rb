class TutorialsController < ApplicationController
  before_action :set_tutorial, only: :show

  def index
  	@tutorials = Tutorial.all
  end

  def show
  end

  private 

  def set_tutorial
  	@tutorial = Tutorial.find(params[:id])
  end


end
