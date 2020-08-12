class GroupsController < ApplicationController
  before_action :set_comments, only: [:index, :show]
  before_action :set_groups, only: [:index, :show]
  
  def index
    @groups = Group.includes(:images).order('created_at DESC')
  end

  def new
    @group = Group.new
    4.times{@group.images.build}
  end

  def show
    @group = Group.find(params[:id])
    @comment = Comment.new
    @comments = @group.comments.includes(:user)
  end

  def create
    @group = Group.new(group_params)
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

  def set_comments
    @comments = Comment.all
  end

  def set_groups
    @groups = Group.order("id DESC")
  end
end
