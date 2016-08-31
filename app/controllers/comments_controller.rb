class CommentsController < ApplicationController
  include AuthHelper

  def update
    @comment = Comment.where(:article_id=>params[:id]).where(:user_id=>current_user.id)[0]
    p "WEEEEEEE"
    p @comment
    p @comment.user.id
    p current_user.id
    if auth_route(@comment.user)
      if @comment.update(comment_params)
        # flash[:success] = "Your profile was successfully updated"
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
    params.require(:comment).permit(:vote)
  end


end
