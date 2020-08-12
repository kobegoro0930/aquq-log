class UsersController < ApplicationController

  before_action :set_comments
  
  def show
    @user = User.find(params[:id])
    @groups = Group.order("id DESC")
  end

  private

  def set_comments
    @comments = Comment.all
  end
end
