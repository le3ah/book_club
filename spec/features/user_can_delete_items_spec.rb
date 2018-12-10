require 'rails_helper'

describe 'delete book review' do
  it "can delete book review" do
    book_1 = Book.create(title: "A Maybe Then a Yes", pages: 300, year: 2000)
    user_15 = User.create(name: "LadyBird")
    review_15 = user_15.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)

    visit user_path(user_15)

    expect(page).to have_content(review_15.title)
    # binding.pry
    click_link 'Delete Review'

    expect(current_path).to eq(user_path(user_15))

    expect(page).to_not have_content(review_15.title)
  end

  # describe 'delete book' do
  #   it 'can delete a book' do
  #     book_1 = Book.create(title: "A Maybe Then a Yes", pages: 300, year: 2000)
  #     book_2 = Book.create(title: "Sometimes", pages: 215, year: 2002)
  #     book_3 = Book.create(title: "Hey", pages: 301, year: 2003)
  #
  #     visit books_path
  #
  #     expect(page).to have_content(book_1.title)
  #     expect(page).to have_content(book_2.title)
  #     expect(page).to have_content(book_3.title)
  #
  #     visit book_path(book_1)
  #
  #     click_link 'Delete Book'
  #
  #     expect(current_path).to eq(books_path)
  #     expect(page).to_not have_content(book_1.title)
  #   end
  # end
end
