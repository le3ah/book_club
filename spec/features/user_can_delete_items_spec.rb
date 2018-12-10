require 'rails_helper'

describe 'delete book review' do
  it "can delete book review" do
    user_15 = User.create(name: "LadyBird")

    review_15 = user_15.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)

    visit user_path(user_id)

    click_link 'Delete Review'

    expect(current_path).to eq(user_path(user_id))
    expect(page).not_to have_content(review_15)

  end
end
