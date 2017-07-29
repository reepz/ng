class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  expose(:comment) { Comment.new }
  expose_decorated(:movies) { Movie.all }

  expose(:movie)
  expose(:movie_comments) { Comment.where(movie_id: movie.id).order('created_at DESC')}

  def send_info
    MovieInfoMailer.send_info(current_user, movie).deliver_now
    redirect_to :back, notice: "Email sent with movie info"
  end

  def export
    file_path = "tmp/movies.csv"
    MovieExporter.new.call(current_user, file_path)
    redirect_to root_path, notice: "Movies exported"
  end
end
