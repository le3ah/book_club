require 'rails_helper'

describe 'sorting on book index page' do
  describe 'as a visitor' do
    it 'should sort by average rating in ascending order' do
      book_1 = Book.create(title: "A Maybe Then a Yes", pages: 300, year: 2000)
      user_15 = User.create(name: "LadyBird")
      user_11 = User.create(name: "Homey the Clown")
      user_1 = User.create(name: "Morgan")

      review_4 = user_15.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      review_5 = user_11.reviews.create(title: "Read!", description: "Pleasant", rating: 5, book: book_1)

      book_2 = Book.create(title: "Sometimes", pages: 215, year: 2002)
      review_5 = user_11.reviews.create(title: "Excellent!", description: "More Please", rating: 4, book: book_2)
      review_7 = user_1.reviews.create(title: "Ex!", description: "Please", rating: 4, book: book_2)

      book_3 = Book.create(title: "Hey", pages: 301, year: 2003)
      review_15 = user_1.reviews.create(title: "Can't Wait", description: "To do it again", rating: 3, book: book_3)
      review_11 = user_15.reviews.create(title: "Wait", description: "again", rating: 3, book: book_3)

      visit books_path

      click_link 'sort books by ascending rating'

      expect(page).to have_content(book_3.title)
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_1.title)
    end
  end
end
