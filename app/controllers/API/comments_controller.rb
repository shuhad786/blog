class Api::CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    render json: @post.comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    post = Post.find(params[:post_id])
    @comment.save!
    render json: @comment, status: :created
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
