require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:year)}
  end

  describe "relationships" do
    it {should have_many(:book_authors)}
    it {should have_many(:reviews)}
    it {should have_many(:authors).through(:book_authors)}
    it {should have_many(:users).through(:reviews)}
  end

  describe "Instance Methods" do
    it ".average_age" do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      user_14.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 5, book: book_1)
      user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 2, book: book_1)

      expect(book_1.avg_rating).to eq(4)
    end

    it ".reviews_count" do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      user_14.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 5, book: book_1)
      user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 2, book: book_1)

      expect(book_1.reviews_count).to eq(3)
    end
  end
end
