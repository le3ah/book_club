require 'rails_helper'

describe 'user_index' do
  it 'user can see all books' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
    author_1 = book_1.authors.create(name: "Harper Lee")

    book_2 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 248, year: 1995)
    author_2 = book_2.authors.create(name: "Christopher Moore")

    book_3 = Book.create(title: "Ethan the Raindrop", pages: 26, year: 2015)
    author_3 = book_3.authors.create(name: "Sean Patrick Guidera")

    visit '/books'

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(author_1.name)
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content("Year: #{book_1.year}")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(author_2.name)
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content("Year: #{book_2.year}")
    expect(page).to have_content(book_3.title)
    expect(page).to have_content(author_3.name)
    expect(page).to have_content("Pages: #{book_3.pages}")
    expect(page).to have_content("Year: #{book_3.year}")
  end
end
