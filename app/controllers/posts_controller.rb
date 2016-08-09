class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	layout 'blog'
	
	def index
	 @blog_category_options = BlogCategory.all.map{|u| [u.title, u.id]}
	 if params[:tag]
    	@posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 3)
  	  elsif params[:blog_category] 
  	  	@posts = Post.where(blog_category: params[:blog_category]).paginate(:page => params[:page], :per_page => 3)
  	  elsif user_signed_in? && current_user.admin?
  	  	@posts = Post.all.paginate(:page => params[:page], :per_page => 3)
	  else 
    	@posts = Post.published.paginate(:page => params[:page], :per_page => 3)
	  end 
    end

	def show
		authorize @post
	end

	def feed
	    @posts = Post.all
	    respond_to do |format|
	      format.rss { render :layout => false }
	    end
  	end


	private 

	def set_post 
	  @post = Post.friendly.find(params[:id])
	end
end
