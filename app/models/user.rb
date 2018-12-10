class User < ApplicationRecord
  has_many :reviews
  has_many :books, through: :reviews
  validates_presence_of :name

  def self.most_reviews
  
    User.arrange.first(3)
  end

  def self.arrange
    User.select('users.*, count(reviews) as reviews_count').joins(:reviews).group(:user_id, :id).order('reviews_count DESC')
  end
end
