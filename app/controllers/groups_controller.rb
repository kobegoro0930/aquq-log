class GroupsController < ApplicationController
  
  before_action :set_all
  
  def index
    @groups = Group.includes(:images).order('created_at DESC')
  end

  def new
    @group = Group.new
    5.times{@group.images.build}
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
    5.times{@group.images.build}
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
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def search
    # binding.pry
    @groups = Group.search(@search_params)
    # @input = Group.search(params[:keyword])
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  private
  def group_params
    params.require(:group).permit(:name, :catchphrase, :title, :text, :area, images_attributes: [:image])
  end

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end

end
