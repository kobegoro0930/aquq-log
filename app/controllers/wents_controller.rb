class WentsController < ApplicationController
  before_action :set_group

  def create
    @went = Went.create(user_id: current_user.id, group_id: params[:group_id])
    @wents = Went.where(group_id: params[:group_id])
    @group.reload
  end

  def destroy
    went = Went.find_by(user_id: current_user.id, group_id: params[:group_id])
    went.destroy
    @wents = Went.where(group_id: params[:group_id])
    @group.reload
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end
