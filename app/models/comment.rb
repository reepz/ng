class Comment < ApplicationRecord
  scope :top_commenters, -> { (Comment.joins(:user).group(:name).count.sort_by {|key, value| value}.reverse.to_h.first(10)) }

  belongs_to :user
  belongs_to :movie
  validates :movie_id, uniqueness: { scope: :user_id, message: "has already been commented" }


end
