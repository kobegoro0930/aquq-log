class UsersController < ApplicationController
<<<<<<< HEAD

  before_action :set_comments
  
  def show
    @user = User.find(params[:id])
    @groups = Group.order("id DESC")
  end

  private

  def set_comments
    @comments = Comment.all
=======
  def show
    @user = User.find(params[:id])
>>>>>>> 451c64c3d2ced3849da3e97a9c5d0885dc6d4d8b
  end
end
