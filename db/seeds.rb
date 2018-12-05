require './app/models/book'
require './app/models/author'

Book.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
book_1 = Book.create(title: "Kiss the Girls", pages: 464, year: 1995, thumbnail: "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/Kiss_The_Girls_book_cover.jpg/220px-Kiss_The_Girls_book_cover.jpg")
author_1 = book_1.authors.create(name: "James Patterson")
user_1 = User.create(name: "MicJagger")
review_1 = user_1.reviews.create(title: "Great Read!" description: "Wow!! Pleasantly surprised." rating: 5)

book_2 = Book.create(title: "The Hiding Place", pages: 241, year: 1971, thumbnail: "https://g.christianbook.com/dg/product/cbd/f400/56696.jpg")
author_2 = book_2.authors.create(name: "Corrie Ten Boom")
user_2 = User.create(name: "DregT")
review_2 = user_2.reviews.create(title: "Intense" description: "I cried...hard." rating: 4)


book_3 = Book.create(title: "The Boy in the Striped Pajamas", pages: 216, year: 2006, thumbnail: "http://prodimage.images-bn.com/pimages/9780385751537_p0_v4_s1200x630.jpg")
author_3 = book_3.authors.create(name: "John Boyne")
user_3 = User.create(name: "Lori")
review_3 = user_3.reviews.create(title: "Blown Away" description: "Masterfully written. A delight for all ages." rating: 5)


book_4 = Book.create(title: "Silas Marner", pages: 140 , year: 1861, thumbnail: "https://images.gr-assets.com/books/1347323528l/54539.jpg")
author_4 = book_4.authors.create(name: "George Eliot")
user_4 = User.create(name: "Jae Bird")
review_4 = user_4.reviews.create(title: "Tough" description: "I had a hard time making it all the way through." rating: 2)


book_5 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/71FxgtFKcQL.jpg")
author_5 = book_5.authors.create(name: "Harper Lee")
user_5 = User.create(name: "jimmthomas78")
review_5 = user_5.reviews.create(title: "Never gets old." description: "This is my fourth time reading this book, and it just keeps getting better." rating: 5)



book_6 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 464, year: 2002, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51i-iA-flpL._SX330_BO1,204,203,200_.jpg")
author_6 = book_6.authors.create(name: "Christopher Moore")
user_6 = User.create(name: "AnnieB")
review_6 = user_6.reviews.create(title: "Hilarious" description: "I laughed, but I also cried.  It crosses the line a little." rating: 3)


book_7 = Book.create(title: "Ethan the Raindrop", pages: 26, year: 2015, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51LhoDAfIlL._SX258_BO1,204,203,200_.jpg")
author_7 = book_7.authors.create(name: "Sean Patrick Guidera")
user_7 = User.create(name: "KellytheGreen")
review_7 = user_7.reviews.create(title: "Sweet" description: "Clever and heart-warming.  Will read again." rating: 5)



book_8 = Book.create(title: "Lincoln in the Bardo", pages: 368, year: 2017, thumbnail: "https://i.mgtbk.nl/boeken/9780525511083-480x600.jpg")
author_8 = book_8.authors.create(name: "George Saunders")
user_8 = User.create(name: "metalfloss23")
review_8 = user_8.reviews.create(title: "Yikes" description: "Why did I even try this?" rating: 1)



book_9 = Book.create(title: "There There", pages: 304, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/91lKQ1w00DL.jpg")
author_9 = book_9.authors.create(name: "Tommy Orange")
user_9 = User.create(name: "June1987")
review_9 = user_9.reviews.create(title: "Too much" description: "Couldn't read after the first chapter." rating: 2)



book_10 = Book.create(title: "Warlight", pages: 304, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/41hW%2BnDBJ7L._SX360_BO1,204,203,200_.jpg")
author_10 = book_10.authors.create(name: "Michael Ondaatje")
user_10 = User.create(name: "BillieMeyers")
review_10 = user_10.reviews.create(title: "Once is enough." description: "Not bad, just not what I wanted." rating: 3)



book_11 = Book.create(title: "The Immortalists", pages: 352, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51Hr9CCR8FL._SX329_BO1,204,203,200_.jpg")
author_11 = book_11.authors.create(name: "Chloe Benjamin")
user_11 = User.create(name: "Jackson5")
review_11 = user_11.reviews.create(title: "Feeling Immortal" description: "Enjoyed every page." rating: 5)



book_12 = Book.create(title: "The Woman in the Window", pages: 240, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/91ulS5E%2BmXL.jpg")
author_12 = book_12.authors.create(name: "A.J. Finn")
user_12 = User.create(name: "Roberts' Bookshelf")
review_12 = user_12.reviews.create(title: "Meh" description: "just okay" rating: 2)
