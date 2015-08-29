class OutlinesController < ApplicationController
	def show
		@lecture = Lecture.find(params[:lecture_id])
		@outline = @lecture.outlines.find(params[:id])
	end


	def create 
		@lecture = Lecture.find(params[:lecture_id])
		@outline = @lecture.outlines.create(outline_params)
			if @outline.save
				redirect_to outline_path(@outline)
			else
				redirect_to root_path
			end
	end

	private

	 def outline_params
      params.require(:outlines).permit(:body, :lecture_id)
    end
end
