require 'rails_helper'

describe 'book show page' do
  it 'user can see book details' do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
    book_1.authors.create(name: "Harper Lee")
    book_1.authors.create(name: "Jimmy Dean")
    user_1 = User.create(name: "MicJagger")
    user_2 = User.create(name: "Sal")
    user_3 = User.create(name: "Megan")
    user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
    user_2.reviews.create(title: "Hey", description: "Wow!! Not Great", rating: 2, book: book_1)
    user_3.reviews.create(title: "Cool", description: "Givita1", rating: 1, book: book_1)


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

  it "links to corresponding book show page" do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
    book_1.authors.create(name: "Harper Lee")
    book_1.authors.create(name: "Jimmy Dean")

    visit books_path

    click_link "#{book_1.title}"
    expect(current_path).to eq(book_path(book_1))
  end
end

describe 'author show page' do
  it "links to corresponding author show page" do
    book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960)
    # book_2 = Book.create(title: "Black Friday", pages: 300, year: 2000)
    author_1 = book_1.authors.create(name: "Harper Lee")
    # book_2.authors.create(name: ["Carl Marx", "Matilda Binum"])

    visit book_path(book_1)

    click_link "#{author_1.name}"

    expect(current_path).to eq(author_path(author_1))
    author_1.books.each do |book|
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.year)
      expect(page).to have_content(book.pages)
    end
  end
end

describe 'user show page' do
  it "links to corresponding user show page" do

    book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
    user_1 = User.create(name: "MicJagger")
    user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)

    book_2 = Book.create(title: "The Hiding Place", pages: 241, year: 1971, thumbnail: "https://g.christianbook.com/dg/product/cbd/f400/56696.jpg")
    user_1.reviews.create(title: "Intense", description: "I cried...hard.", rating: 4, book: book_2)
    visit book_path(book_1)

    within "#all-reviews" do
      click_link "#{user_1.name}"

      expect(current_path).to eq(user_path(user_1))
    end
  end

    it 'should see review info on user show page' do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)

      book_2 = Book.create(title: "The Hiding Place", pages: 241, year: 1971, thumbnail: "https://g.christianbook.com/dg/product/cbd/f400/56696.jpg")
      user_1.reviews.create(title: "Intense", description: "I cried...hard.", rating: 4, book: book_2)

      visit user_path(user_1)

      user_1.reviews.each do |review|

        expect(page).to have_content("Review Title: #{review.title}")
        expect(page).to have_content("Review: #{review.description}")
        expect(page).to have_content("Rating: #{review.rating}")

      end
    end
end
