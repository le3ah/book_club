require 'rails_helper'

describe Author, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:book_authors)}
    it {should have_many(:books).through(:book_authors)}
  end
  describe "instance methods" do
    it "destroys author" do
      author_1 = Author.create(name: "Jane")
      author_2 = Author.create(name: "Jim")
      Book.create(title: "A Maybe Then a Yes", pages: 300, year: 2000, authors: [author_1, author_2])
      Book.create(title: "Baby I got ya money", pages: 250, year: 2000, authors: [author_2])

      author_1.destroy

      expect(Book.count).to eq(1)
      expect(Author.count).to eq(1)
    end
  end
end
