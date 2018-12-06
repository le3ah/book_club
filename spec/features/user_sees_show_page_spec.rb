require 'rails_helper'

describe 'user show page' do
  it 'user can see book details' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
    author_1 = book_1.authors.create(name: "Harper Lee")
    author_2 = book_1.authors.create(name: "Jimmy Dean")
    user_1 = User.create(name: "MicJagger")
    user_2 = User.create(name: "Sal")
    user_3 = User.create(name: "Megan")
    review_1 = user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
    review_2 = user_2.reviews.create(title: "Hey", description: "Wow!! Not Great", rating: 2, book: book_1)
    review_3 = user_3.reviews.create(title: "Cool", description: "Givita1", rating: 1, book: book_1)


    visit book_path(book_1)

    expect(page).to have_content("#{book_1.title}")
    book_1.authors.each do |author|
      expect(page).to have_content("#{author.name}")
    end

    expect(page).to have_content("#{book_1.pages}")
    book_1.reviews.each do |review|
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.user.name)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.description)
    end
    # expect(page).to have_content(book_1.avg_rating)
  end
end
