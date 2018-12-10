require 'rails_helper'

describe 'new author form' do
  it 'should create new book' do
    book_title = "See Spot Run"
    book_author = 'Billy Madison'

    visit new_book_path
    # visit '/books/new'

    fill_in :book_title, with: book_title
    fill_in :book_year, with: 1974
    fill_in :book_pages, with: 52
    fill_in :book_authors, with: book_author
    click_on 'Create Book'

    expect(current_path).to eq(books_path)
    expect(page).to have_content(book_title)
    expect(page).to have_content(book_author)
  end
  it 'should create new book with multiple authors' do
    book_title = "See Spot Run"
    author_1 = 'Billy Madison'
    author_2 = 'Happy Gilmore'

    visit new_book_path
    # visit '/books/new'

    fill_in :book_title, with: book_title
    fill_in :book_year, with: 1974
    fill_in :book_pages, with: 52
    fill_in :book_authors, with: "#{author_1},#{author_2}"
    click_on 'Create Book'

    expect(current_path).to eq(books_path)
    expect(page).to have_content(book_title)
    expect(page).to have_content(author_1)
    expect(page).to have_content(author_2)
  end
  it 'should create new book with multiple authors and a space' do
    book_title = "See Spot Run"
    author_1 = 'Billy Madison'
    author_2 = 'Happy Gilmore'

    visit new_book_path
    # visit '/books/new'

    fill_in :book_title, with: book_title
    fill_in :book_year, with: 1974
    fill_in :book_pages, with: 52
    fill_in :book_authors, with: "#{author_1}, #{author_2}"
    click_on 'Create Book'

    expect(current_path).to eq(books_path)
    expect(page).to have_content(book_title)
    expect(page).to have_content(author_1)
    expect(page).to have_content(author_2)
  end
  it 'should create new book with multiple authors and a space' do

    visit new_book_path
    # visit '/books/new'

    click_on 'Create Book'

    expect(current_path).to eq(books_path)
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Pages can't be blank")
    expect(page).to have_content("Year can't be blank")
  end
  xit 'should show default image if thumbnail not provided' do
    book_title = "See Spot Run"
    author_1 = 'Billy Madison'
    author_2 = 'Happy Gilmore'

    visit new_book_path
    # visit '/books/new'

    fill_in :book_title, with: book_title
    fill_in :book_year, with: 1974
    fill_in :book_pages, with: 52
    fill_in :book_authors, with: "#{author_1}, #{author_2}"
    click_on 'Create Book'

    expect(current_path).to eq(books_path)
    expect(page).to have_content(book_title)
    expect(page).to have_content(author_1)
    expect(page).to have_content(author_2)
  end
end
