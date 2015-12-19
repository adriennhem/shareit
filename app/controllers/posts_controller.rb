class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	
	def index
		@posts = Post.order(created_at: :desc)
	end 


	def show
	end


	private 

	  def set_post 
		@post = Post.find(params[:id])
	  end

	     # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :content, :blog_category_id)
	  end
end
