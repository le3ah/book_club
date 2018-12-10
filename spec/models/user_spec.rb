require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:reviews)}
    it {should have_many(:books).through(:reviews)}
  end

  # describe "instance method" do
  #   it "destroys review" do
  #     book_1 = Book.create(title: "A Maybe Then a Yes", pages: 300, year: 2000)
  #     user_15 = User.create(name: "LadyBird")
  #     user_2 = User.create(name: "Marty")
  #     review_15 = user_15.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
  #     review_1 = user_2.reviews.create(title: "Try Again", description: "Unusual", rating: 2, book: book_1)
  #
  #     review_1.destroy
  #     expect(book_1.reviews_count).to eq(1)
  #   end
  # end
end
