class CommentsController < ApplicationController
  before_action :set_group

  def new
    @comment = Comment.new
    @comments = @group.comments.includes(:user)
  end
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to group_path(@comment.group.id)
    else
      render :new
      # @comments = @group.comments.includes(:user)
      # flash.now[:alert] = 'メッセージを入力してください。'
      # render group_path(@group)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
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
    params.require(:comment).permit(:title, :text, :visit_date).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
