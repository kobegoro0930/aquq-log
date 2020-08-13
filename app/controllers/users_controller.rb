class UsersController < ApplicationController

  before_action :set_all
  
  def show
    @user = User.find(params[:id])
    @groups = Group.order("id DESC")
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end
end
