class UsersController < ApplicationController

  before_action :set_all
  
  def show
    @user = current_user
    @groups = current_user.went_groups
  end

  def liked
    @user = current_user
    @groups = current_user.like_groups
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
    @q = Group.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:area, :text)
  end
end
