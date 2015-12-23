class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	layout 'blog'
	
	def index
	 @blog_category_options = BlogCategory.all.map{|u| [u.title, u.id]}
	 @posts = policy_scope(Post) 
	 if params[:tag]
    	@posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 3)
  	  elsif params[:blog_category] 
  	  	@posts = Post.where(blog_category: params[:blog_category]).paginate(:page => params[:page], :per_page => 3)
	  else 
    	@posts = Post.where(published: true).paginate(:page => params[:page], :per_page => 3)
	  end 
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
