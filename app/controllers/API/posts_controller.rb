class API::PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(:created_at DESC).includes(:comments)
    json_response(@posts)
  end
end
