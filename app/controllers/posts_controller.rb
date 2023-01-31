class PostsController < ApplicationController
  def index
    @posts = Post.all
    render status: 200
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
