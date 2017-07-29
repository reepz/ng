class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_uniqueness_of :movie_id, scope: :user_id, message: "has already been commented"
end
