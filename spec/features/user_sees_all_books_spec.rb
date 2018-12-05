require 'rails_helper'

describe 'user_index' do
  it 'user can see all books' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
    book_2 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 248, year: 1995)
    book_3 = Book.create(title: "Ethan the Raindrop", pages: 26, year: 2015)

    visit '/books'

    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content(book_3.title)
    expect(page).to have_content("Pages: #{book_3.pages}")
  end
end
