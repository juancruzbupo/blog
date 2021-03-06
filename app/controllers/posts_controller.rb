class PostsController < ApplicationController

  def index
  	@post = Post.all 
  end

  def klass
    Post
  end

  def create
	 @post = Post.new(params[:posts].permit(:title, :body))
	 if @post.save
    redirect_to @post
   else
    render 'new'
   end
	end

  def show
    @post = Post.find params[:id]
  end
  
  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id] 
    @post.update(post_params)
    redirect_to post_url(@post)
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
