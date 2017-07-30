class CommentsController < ApplicationController
  before_action :authenticate_user!, except: :index

  expose(:movie)
  expose(:movie_comments) { movie.comments }

  expose(:comments) { Comment.all }
  expose(:comment)
  expose(:user_comment) { Comment.where(id: current_user.id)}

  # couldnt figure how to access model scope with decent_exposure
  def index
    @top_commenters = Comment.top_commenters
  end

  def create
    comment.movie_id = movie.id
    comment.user_id = current_user.id

    if comment.save
      redirect_to movie_path(movie), notice: 'Comment was successfully created.'
    else
      redirect_to movie_path(movie), alert: 'You have already commented on this movie. Remove existing comment to add a new one.'
    end
  end

  def update
    if comment.update(comment_params)
      redirect_to movie_path(movie), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    comment.destroy
    redirect_to movie_url(movie), notice: 'Comment was successfully destroyed.'
  end



  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :movie_id)
  end
end
