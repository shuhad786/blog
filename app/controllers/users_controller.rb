class UsersController < ApplicationController
  def index
    @users = User.all
    render status: 200
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
