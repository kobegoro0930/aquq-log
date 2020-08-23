class UsersController < ApplicationController

  before_action :set_all
  
  def show
    @user = User.find(params[:id])
    @groups = current_user.went_groups
  end

  def liked
    
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end
end
