class CommentsController < ApplicationController

def klass
  Comment
end

def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

