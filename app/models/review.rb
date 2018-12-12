class Review < ApplicationRecord
  validates_presence_of :title, :description, :rating

  validates :rating, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1, only_integer: true}

  belongs_to  :book
  belongs_to  :user

  def self.newest
    Review.order("created_at DESC")
  end

  def self.oldest
    Review.order("created_at ASC")
  end
end
