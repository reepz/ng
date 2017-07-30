# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord

  scope :top_commenters, -> { Comment.joins(:user).group(:user_id).count }
  belongs_to :genre
  has_many :comments
  validates_with TitleBracketsValidator
end
