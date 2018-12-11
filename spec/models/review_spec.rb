require 'rails_helper'

describe Review, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:rating)}
  end

  describe "relationships" do
    it {should belong_to(:book)}
    it {should belong_to(:user)}
  end
  describe "Class Methods" do
    it ".newest" do

    end
    it ".oldest" do
      book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
      user_1 = User.create(name: "MicJagger")
      user_2 = User.create(name: "Good Reader")
      review_1 = user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 2, book: book_1)
      review_2 = user_2.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 2, book: book_1)
      review_1.created_at = Time.parse("2018-07-31")
      review_2.created_at = Time.parse("2018-02-05")

      expected = Review.oldest

      expect(expected).to eq([review_2, review_1])
    end
    it ".newest" do
      book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
      user_1 = User.create(name: "MicJagger")
      user_2 = User.create(name: "Good Reader")
      review_1 = user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 2, book: book_1)
      review_2 = user_2.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 2, book: book_1)
      review_1.created_at = Time.parse("2018-07-31")
      review_2.created_at = Time.parse("2018-02-05")

      expected = Review.newest

      expect(expected).to eq([review_1, review_2])
    end
  end
end
