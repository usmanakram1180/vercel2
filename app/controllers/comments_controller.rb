class CommentsController < ApplicationController
  def create
    @home = Home.find(params[:home_id])
    @comment = current_user.comments.new(comment_params.merge(home_id: @home.id))

    respond_to do |format|
      if @comment.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: Comment.new }) }
        format.html { render partial: 'comments/form', locals: { comment: Comment.new }}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: @comment }) }
        format.html { render partial: 'comments/form', locals: { comment: @comment }}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
