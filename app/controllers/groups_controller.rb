class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:images).order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    # @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :catchphrase, :title, :text, :area, images_attributes: [:image])
  end
end
