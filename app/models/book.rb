class Book < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :authors, through: :book_authors
  validates_presence_of :title, :pages, :year

  def avg_rating
    reviews.average(:rating).to_f.round(1)
  end

  def reviews_count
    reviews.size
  end

  def sort_reviews(direction)
    reviews.order("rating #{direction}")
  end

  def self.sort_reviews_number(direction)
    Book.arrange("reviews_count", "#{direction}")
  end

  def self.num_pages_sort(direction)
    Book.order("pages #{direction}")
  end

  def top_3_reviews
    sort_reviews('DESC').first(3)
  end

  def bottom_3_reviews
    sort_reviews('ASC').first(3)
  end

  def self.highest_rated_3
    Book.arrange('avg_rating', 'DESC').first(3)
  end

  def self.lowest_rated_3
    Book.arrange('avg_rating', 'ASC').first(3)
  end

  def self.highest_rated_average(direction)
    Book.arrange("avg_rating", "#{direction}")
  end

  def self.arrange(column, direction)
    Book.select('books.*, avg(rating) as avg_rating, count(reviews) as reviews_count')
    .joins(:reviews)
    .group(:book_id, :id)
    .order("#{column} #{direction}")
  end

  def multiple_authors(id)
    authors.where.not(id: id)
  end
end
