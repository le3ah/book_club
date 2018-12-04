require 'rails_helper'

describe 'user_index' do
  it 'user can see all books' do
    book_1 = Book.create(title: "To Kill a Mockingbird", author: "Harper Lee", pages: 367)
    book_2 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", author: "Christopher Moore", pages: 248)
    book_3 = Book.create(title: "Ethan the Raindrop", author: "Sean Patrick Guidera", pages: 28)

    visit '/books'

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.author)
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.author)
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content(book_3.title)
    expect(page).to have_content(book_3.author)
    expect(page).to have_content("Pages: #{book_3.pages}")
  end
end
