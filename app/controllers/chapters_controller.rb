class ChaptersController < ApplicationController
	  before_action :authenticate_user!, only: :show  

	
	def create 
		@lecture = Lecture.friendly.find(params[:lecture_id])
		@chapter = @lecture.chapters.create(chapter_params)
			if @chapter.save
				redirect_to chapter_path(@chapter)
			else
				redirect_to root_path
			end
	end

	private

	def chapter_params
		params.require(:chapter).permit(:title, :description, :number, lessons_attributes: [:title, :description, :vid, :etape])
	end
end

