class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comm_params)
    @comment.save


    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to @comment.post
  end

  private

  def comm_params
    params.require(:comment).permit(:body)
  end
end
