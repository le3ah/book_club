class Book < ApplicationRecord
  has_many :book_authors
  has_many :reviews
  has_many :users, through: :reviews
  has_many :authors, through: :book_authors
  validates_presence_of :title, :pages, :year

  def avg_rating
    reviews.average(:rating).to_f.round(1)
  end

  def reviews_count
    reviews.size
  end

  def self.highest_rated_3
    Book.arrange('avg_rating', 'DESC').first(3)
  end

  def self.lowest_rated_3
    Book.arrange('avg_rating', 'ASC').first(3)
  end

  def self.arrange(column, direction)
    Book.select('books.*, avg(rating) as avg_rating, count(reviews) as reviews_count').joins(:reviews).group(:book_id, :id).order("#{column} #{direction}")
  end

  
end
