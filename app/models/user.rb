class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :books, through: :reviews
  validates :name, uniqueness: true, presence: true

  def self.top_3_reviewers

    User.most_reviews.first(3)
  end

  def self.most_reviews
    User.select('users.*, count(reviews) as reviews_count').joins(:reviews).group(:user_id, :id).order('reviews_count DESC')
  end


end
