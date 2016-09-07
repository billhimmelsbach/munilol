class CommentsController < ApplicationController
  include AuthHelper

  def update
    # TODO: The following line of code gets the user's first comment on that
    #       article, not the specific comment that is selected
    # TODO: It should also be refactored to:
    #          Comment.where({article_id: params[:id], user_id: current_user.id})[0]
    # TODO: Add space around your fat arrow operators
    @comment = Comment.where(:article_id => params[:id]).where(:user_id => current_user.id)[0]
    if auth_route(@comment.user)
      if @comment.update(comment_params)
        render json: @comment
      else
        flash[:notice] = "Cannot create your comment: #{@comments.errors.full_messages.join(', ')}."
        render root_path
      end
    else
      auth_fail("You can't update this comment!", @comment.article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:vote, :article_id, :user_id)
  end
end
