class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save!
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

end
