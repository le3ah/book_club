require 'rails_helper'

describe 'new review form' do
  it 'should create a new review' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960)
    # user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)

    review_title = "A little off-putting"
    user_name = "Rockstar1"
    review_description = "Slow start, but I enjoyed it overall."

    visit new_book_review_path(book_1.id)
    # visit '/books/book_1/new_review'

    fill_in 'review[title]', with: review_title
    fill_in 'review[user]', with: user_name
    fill_in 'review[rating]', with: 3
    fill_in 'review[description]', with: review_description
    click_on 'Create Review'

    expect(current_path).to eq(book_path(book_1))
    expect(page).to have_content(review_title)
    expect(page).to have_content(user_name)
    expect(page).to have_content(review_description)

  end
  it 'redirect to the new review page' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960)
    # user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)

    review_title = "A little off-putting"
    user_name = "Rockstar1"
    review_description = "Slow start, but I enjoyed it overall."

    visit new_book_review_path(book_1.id)
    # visit '/books/book_1/new_review'

    fill_in 'review[title]', with: review_title
    fill_in 'review[user]', with: user_name
    fill_in 'review[rating]', with: 8
    fill_in 'review[description]', with: review_description
    click_on 'Create Review'

    expect(current_path).to eq("/books/#{book_1.id}/reviews")

  end

end
