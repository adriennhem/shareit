class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	layout 'blog'
	
	def index
	 if params[:tag]
    	@posts = Post.tagged_with(params[:tag]).order(created_at: :desc)
  	  elsif params[:blog_category] 
  	  	@posts = Post.where(blog_category: params[:blog_category]).order(created_at: DESC)
	  else 
    	@posts = Post.order(created_at: :desc)
	  end 
	  @posts = policy_scope(Post) 
    end

	def show
		authorize @post
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
