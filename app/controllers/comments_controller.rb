class CommentsController < ApplicationController
  
  before_action :set_all

  def new
    @comment = Comment.new
    @comments = @group.comments.includes(:user)
  end
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to group_path(@comment.group.id)
    else
      # @group = Group.find(params[:group_id])
      # @comments = @group.comments.includes(:user)
      flash[:alert] = "コメントの投稿に失敗しました。入力内容をご確認ください。"
      redirect_to group_path(@comment.group.id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @group = Group.find(params[:group_id])
    @comments = @group.comments.includes(:user)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to group_path(@comment.group.id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to group_path(@comment.group.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text, :visit_date, :rate).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
    @q = Group.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:area, :text)
  end
end
