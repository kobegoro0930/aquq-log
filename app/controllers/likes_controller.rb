class LikesController < ApplicationController
  before_action :set_group

  def create
    @like = Like.create(user_id: current_user.id, group_id: params[:group_id])
    @likes = Like.where(group_id: params[:group_id])
    @group.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, group_id: params[:group_id])
    like.destroy
    @likes = Like.where(group_id: params[:group_id])
    @group.reload
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end
