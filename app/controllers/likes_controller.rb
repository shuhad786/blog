class LikesController < ApplicationController
  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    post = Post.find(params[:post_id])
    redirect_to user_post_path(current_user.id, post) if @like.save
  end
end
