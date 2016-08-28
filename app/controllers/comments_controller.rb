class CommentsController < ApplicationController
  include AuthHelper

  def update
    @comment = Comment.find_by_id(params[:id])
    @user = current_user
    if auth_route(@user)
      if @comment.update(comment_params)
        # flash[:success] = "Your profile was successfully updated"
        redirect_to @comment.article
      else
        render root_path
      end
    else
      auth_fail("You can't update this comment!", @user)
      redirect_to @comment.article
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:vote)
  end


end
