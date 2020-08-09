class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to group_path(@comment.group.id)
    # else
      # @comments = @group.comments.includes(:user)
      # flash.now[:alert] = 'メッセージを入力してください。'
      # render group_path(@group)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text, :visit_date).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
