class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @post = Post.new
    @comment = Comment.new

    render json: comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    post = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_post_path(current_user.id, post)
      render json: comment
    else
      render :new
    end
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { post: @comment } }
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def destroy
    Comment.delete(params[:id])
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end
