class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	
	def index
	 if params[:tag]
    	@posts = Post.tagged_with(params[:tag])
  	  else
    	@posts = Post.order(created_at: :desc)
	  end  
    end


	def show
	end


	private 

	  def set_post 
		@post = Post.friendly.find(params[:id])
	  end

	     # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :content, :blog_category_id, :published, :user_id, :tag_list, :permalink)
	  end
end
