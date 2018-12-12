require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:year)}
  end

  describe "relationships" do
    it {should have_many(:book_authors)}
    it {should have_many(:reviews)}
    it {should have_many(:authors).through(:book_authors)}
    it {should have_many(:users).through(:reviews)}
  end

  describe "Class Methods" do
    it ".sort_reviews_number(direction)" do
      book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
      user_1 = User.create(name: "MicJagger")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      user_16 = User.create(name: "Good Reader")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 2, book: book_1)
      user_16.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 2, book: book_1)
      user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 1, book: book_1)


      book_2 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 248, year: 1995)
      user_1.reviews.create(title: "fine", description: "No more of this", rating: 1, book: book_2)
      user_14.reviews.create(title: "just okay", description: "No thanks", rating: 1, book: book_2)
      user_15.reviews.create(title: "pretty bad", description: "Did not like", rating: 1, book: book_2)
      user_16.reviews.create(title: "not the best", description: "Nope", rating: 1, book: book_2)

      expect(Book.sort_reviews_number('ASC')).to eq([book_1, book_2])
      expect(Book.sort_reviews_number('DESC')).to eq([book_2, book_1])
    end
    it ".num_pages_sort(direction)" do
      book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
      book_2 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 248, year: 1995)
      book_3 = Book.create(title: "Ethan the Raindrop", pages: 26, year: 2015)

      expect(Book.num_pages_sort('ASC')).to eq([book_3, book_2, book_1])
      expect(Book.num_pages_sort('DESC')).to eq([book_1, book_2, book_3])
    end

  end
  describe "Instance Methods" do
    it ".average_age" do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      user_14.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 5, book: book_1)
      user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 2, book: book_1)

      expect(book_1.avg_rating).to eq(4)
    end

    it ".average_rating" do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      user_14.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 5, book: book_1)
      user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 2, book: book_1)

      expect(book_1.avg_rating).to eq(4)
    end

    it ".reviews_count" do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      user_14.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 5, book: book_1)
      user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 2, book: book_1)

      expect(book_1.reviews_count).to eq(3)
    end

    it ".sort_reviews(direction)" do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      review_1 = user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      review_2 = user_14.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 4, book: book_1)
      review_3 = user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 2, book: book_1)

      expect(book_1.sort_reviews('ASC')).to eq([review_3, review_2, review_1])
      expect(book_1.sort_reviews('DESC')).to eq([review_1, review_2, review_3])
    end

    it ".top_3_reviews and .bottom_3_reviews" do
      book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
      user_1 = User.create(name: "MicJagger")
      user_2 = User.create(name: "Trey")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      review_1 = user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 4, book: book_1)
      review_2 = user_14.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 5, book: book_1)
      review_3 = user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 2, book: book_1)
      review_4 = user_2.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 3, book: book_1)

      expect(book_1.top_3_reviews).to eq([review_2, review_1, review_4])
      expect(book_1.bottom_3_reviews).to eq([review_3, review_4, review_1])
    end


    it "destroys book" do
      book_1 = Book.create(title: "A Maybe Then a Yes", pages: 300, year: 2000)
      book_2 = Book.create(title: "Baby I got ya money", pages: 250, year: 2000)

      expect(Book.count).to eq(2)
      book_1.destroy
      expect(Book.count).to eq(1)
    end

    it "sorts books by ascending rating" do
      book_1 = Book.create(title: "A Maybe Then a Yes", pages: 300, year: 2000)
      user_15 = User.create(name: "LadyBird")
      user_11 = User.create(name: "Homey the Clown")
      user_1 = User.create(name: "Morgan")

      review_4 = user_15.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 5, book: book_1)
      review_5 = user_11.reviews.create(title: "Read!", description: "Pleasant", rating: 5, book: book_1)

      book_2 = Book.create(title: "Sometimes", pages: 215, year: 2002)
      review_5 = user_11.reviews.create(title: "Excellent!", description: "More Please", rating: 4, book: book_2)
      review_7 = user_1.reviews.create(title: "Ex!", description: "Please", rating: 4, book: book_2)

      book_3 = Book.create(title: "Hey", pages: 301, year: 2003)
      review_15 = user_1.reviews.create(title: "Can't Wait", description: "To do it again", rating: 3, book: book_3)
      review_11 = user_15.reviews.create(title: "Wait", description: "again", rating: 3, book: book_3)

      expect(Book.highest_rated_average("ASC")).to eq([book_3, book_2, book_1])
    end
  end

  describe 'Statistics' do
    it 'shows statistics'do
      book_1 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960,)
      user_1 = User.create(name: "MicJagger")
      user_2 = User.create(name: "1234books")
      user_14 = User.create(name: "Aaron")
      user_15 = User.create(name: "Leah")
      user_16 = User.create(name: "Good Reader")
      user_1.reviews.create(title: "Great Read!", description: "Wow!! Pleasantly surprised.", rating: 2, book: book_1)
      user_16.reviews.create(title: "He's the best", description: "I never miss one of his books", rating: 2, book: book_1)
      user_15.reviews.create(title: "Oh no", description: "Couldn't finish", rating: 1, book: book_1)


      book_2 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 248, year: 1995)
      user_1.reviews.create(title: "fine", description: "No more of this", rating: 1, book: book_2)
      user_14.reviews.create(title: "just okay", description: "No thanks", rating: 1, book: book_2)
      user_15.reviews.create(title: "pretty bad", description: "Did not like", rating: 1, book: book_2)
      user_16.reviews.create(title: "not the best", description: "Nope", rating: 1, book: book_2)

      book_3 = Book.create(title: "Ethan the Raindrop", pages: 26, year: 2015)
      user_1.reviews.create(title: "Hooray!", description: "Great!", rating: 5, book: book_3)
      user_16.reviews.create(title: "Lovely", description: "More please", rating: 5, book: book_3)
      user_15.reviews.create(title: "Wonderful", description: "Couldn't put it down", rating: 5, book: book_3)

      book_4 = Book.create(title: "See Spot Run", pages: 24, year: 1915)
      user_1.reviews.create(title: "A treasure", description: "Will read again", rating: 5, book: book_4)
      user_14.reviews.create(title: "Excellent", description: "The kids loved it!", rating: 4, book: book_4)
      user_15.reviews.create(title: "Sad", description: "Too much for me", rating: 3, book: book_4)

      book_5 = Book.create(title: "Testing", pages: 224, year: 1995)
      user_1.reviews.create(title: "thumbs down", description: "Will not read again", rating: 1, book: book_5)
      user_2.reviews.create(title: "don't bother", description: "Couldn't get past the first page", rating: 4, book: book_5)
      user_15.reviews.create(title: "why", description: "The kids hated it!", rating: 3, book: book_5)

      book_6 = Book.create(title: "Another", pages: 284, year: 1999)
      user_1.reviews.create(title: "eek", description: "never a good idea", rating: 1, book: book_5)
      user_2.reviews.create(title: "don't", description: "Couldn't get past the first chapter", rating: 2, book: book_6)

      expect(Book.highest_rated_3.map { |book| book.title}).to eq(["Ethan the Raindrop", "See Spot Run", "Testing"])
      expect(Book.lowest_rated_3.map { |book| book.title}).to eq(["Lamb: The Gospel According to Biff, Christ's Childhood Pal", "To Kill a Mockingbird", "Another"])
      expect(User.top_3_reviewers.map { |user| user.name}).to eq (["MicJagger", "Leah", "Good Reader"])
    end
  end
end
