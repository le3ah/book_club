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
end
