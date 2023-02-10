class API::CommentsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    json_response(@post.comments)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    post = Post.find(params[:post_id])
    @comment.save!
    json_response(@comment, :created)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
