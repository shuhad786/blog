class PostsController < ApplicationController
  def index
    @posts = Post.all
    render status: 200
  end

  def show
    @post = Post.find(params[:id])
  end
end
