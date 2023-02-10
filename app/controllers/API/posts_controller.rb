class Api::PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    render json: @posts
  end
end
