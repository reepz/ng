class CommentsController < ApplicationController
  expose :comments, ->{ Comment.all }
  expose :comment

  def create
    if comment.save
      redirect_to comment, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if comment.update(comment_params)
      redirect_to comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :movie_id)
  end
end
