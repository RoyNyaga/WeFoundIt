class CommentsController < ApplicationController

  def update
    @missing_item = MissingItem.find_by(id: params[:comment][:missing_item_id])
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment was successfully Updated"
      redirect_to @missing_item
    end
  end

  def create
    @missing_item = MissingItem.find_by(id: params[:comment][:missing_item_id])
    @comment = Comment.new(comment_params)
    if @comment.save?
      flash[:notice] = "Comment was successfully Added"
      redirect_to @missing_item
    end
  end

  def comment_params
    params.require(:comment).permit(:missing_item_id, :user_id)
  end
end
