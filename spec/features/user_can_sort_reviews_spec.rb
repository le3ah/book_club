require 'rails_helper'

describe 'user_show_page' do
  describe "can sort reviews by date" do
    it "can show newest review first" do
      book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960)
      book_2 = Book.create(title: "To Kill a Mockingbird II", pages: 285, year: 1970)
      user_2 = User.create(name: "Good Reader")
      review_1 = user_2.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 2, book: book_1)
      review_2 = user_2.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 2, book: book_2)
      review_3 = user_2.reviews.create(title: "Hooray!", description: "wonderful; truly!", rating: 5, book: book_1)
      review_1.created_at = Time.parse("2018-07-31")
      review_2.created_at = Time.parse("2018-02-05")
      review_3.created_at = Time.parse("2017-05-02")
      visit user_path(user_2)

      click_on "sort reviews newest first"
      expect(page).to have_current_path("/users/#{user_2.id}?sort=reviews_newest")

      expect(page).to have_content(user_2.reviews.first.title)

    end
    it "can show oldest review first" do
      book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960)
      book_2 = Book.create(title: "To Kill a Mockingbird II", pages: 285, year: 1970)
      user_2 = User.create(name: "Good Reader")
      review_1 = user_2.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 2, book: book_1)
      review_2 = user_2.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 2, book: book_2)
      review_3 = user_2.reviews.create(title: "Hooray!", description: "wonderful; truly!", rating: 5, book: book_1)
      review_1.created_at = Time.parse("2018-07-31")
      review_2.created_at = Time.parse("2018-02-05")
      review_3.created_at = Time.parse("2017-05-02")
      visit user_path(user_2)

      click_on "sort reviews oldest first"
      expect(page).to have_current_path("/users/#{user_2.id}?sort=reviews_oldest")

      expect(page).to have_content(user_2.reviews.last.title)
    end
  end
end
