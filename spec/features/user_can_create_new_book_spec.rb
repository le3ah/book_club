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
