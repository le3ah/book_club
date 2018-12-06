require 'rails_helper'

describe 'user show page' do
  it 'user can see book details' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
    book_2 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 248, year: 1995)

    visit book_path(book_1)

    expect(page).to have_content("#{book_1.title}")
  end
end
