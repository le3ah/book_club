require 'rails_helper'

describe 'new author form' do
  it 'should create new book' do
    book_title = "See Spot Run"
    book_author = 'Billy Madison'

    visit new_book_path

    fill_in :book_title, with: book_title
    fill_in :book_year, with: 1974
    fill_in :book_pages, with: 52
    fill_in :book_authors, with: book_author
    click_on 'Create Book'

    expect(current_path).to eq(books_path)
    expect(page).to have_content(book_title)
    expect(page).to have_content(book_author)
  end
end

describe 'new user form' do
  it 'should create a new review' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960)
    # user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)

    review_title = "A little off-putting"
    user_name = "Rockstar1"
    review_description = "Slow start, but I enjoyed it overall."

    visit new_book_review_path(book_1.id)
    save_and_open_page
    fill_in :user_review_title, with: review_title
    fill_in :user_name, with: user_name
    fill_in :user_review_rating, with: 3
    fill_in :user_review_description, with: review_description
    click_on 'Create Review'

    expect(current_path).to eq(book_path(book))
    expect(page).to have_content(review_title)
    expect(page).to have_content(user_name)
    expect(page).to have_content(review_description)

  end
end
