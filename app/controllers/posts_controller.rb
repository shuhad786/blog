class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts.includes(:comments)
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'posts/show'
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.CommentsCounter = 0
    @post.LikesCounter = 0
    @post.author_id = current_user.id
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
