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
# author_1 = book_1.authors.create(name: "James Patterson")

book_2 = Book.create(title: "The Hiding Place", pages: 241, year: 1971, thumbnail: "https://g.christianbook.com/dg/product/cbd/f400/56696.jpg")
# author_2 = book_2.authors.create(name: "Corrie Ten Boom")

book_3 = Book.create(title: "The Boy in the Striped Pajamas", pages: 216, year: 2006, thumbnail: "http://prodimage.images-bn.com/pimages/9780385751537_p0_v4_s1200x630.jpg")
# author_3 = book_3.authors.create(name: "John Boyne")

book_4 = Book.create(title: "Silas Marner", pages: 140 , year: 1861, thumbnail: "https://images.gr-assets.com/books/1347323528l/54539.jpg")
# author_4 = book_4.authors.create(name: "George Eliot")

book_5 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/71FxgtFKcQL.jpg")
# author_5 = book_5.authors.create(name: "Harper Lee")


book_6 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 464, year: 2002, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51i-iA-flpL._SX330_BO1,204,203,200_.jpg")
# author_6 = book_6.authors.create(name: "Christopher Moore")

book_7 = Book.create(title: "Ethan the Raindrop", pages: 26, year: 2015, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51LhoDAfIlL._SX258_BO1,204,203,200_.jpg")
# author_7 = book_7.authors.create(name: "Sean Patrick Guidera")


book_8 = Book.create(title: "Lincoln in the Bardo", pages: 368, year: 2017, thumbnail: "https://i.mgtbk.nl/boeken/9780525511083-480x600.jpg")
# author_8 = book_8.authors.create(name: "George Saunders")


book_9 = Book.create(title: "There There", pages: 304, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/91lKQ1w00DL.jpg")
# author_9 = book_9.authors.create(name: "Tommy Orange")


book_10 = Book.create(title: "Warlight", pages: 304, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/41hW%2BnDBJ7L._SX360_BO1,204,203,200_.jpg")
# author_10 = book_10.authors.create(name: "Michael Ondaatje")


book_11 = Book.create(title: "The Immortalists", pages: 352, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51Hr9CCR8FL._SX329_BO1,204,203,200_.jpg")
# author_11 = book_11.authors.create(name: "Chloe Benjamin")


book_12 = Book.create(title: "The Woman in the Window", pages: 240, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/91ulS5E%2BmXL.jpg")
# author_12 = book_12.authors.create(name: "A.J. Finn")
