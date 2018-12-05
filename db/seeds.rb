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
book_2 = Book.create(title: "Along Came a Spider", pages: 435, year: 1993, thumbnail: "https://images.gr-assets.com/books/1330119158l/231623.jpg")
book_3 = Book.create(title: "1st to Die", pages: 462, year: 2001, thumbnail: "https://upload.wikimedia.org/wikipedia/en/5/5a/1st_to_Die.jpg")
book_4 = Book.create(title: "Bloodsucking Fiends", pages: 304 , year: 1995, thumbnail: "https://www.chrismoore.com/wp-content/uploads/2013/08/BF_us_paperback-194x300.jpg")
book_5 = Book.create(title: "To Kill a Mockingbird", pages: 281, year: 1960, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/71FxgtFKcQL.jpg")
book_6 = Book.create(title: "Lamb: The Gospel According to Biff, Christ's Childhood Pal", pages: 464, year: 2002, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51i-iA-flpL._SX330_BO1,204,203,200_.jpg")
book_7 = Book.create(title: "Ethan the Raindrop", pages: 26, year: 2015, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51LhoDAfIlL._SX258_BO1,204,203,200_.jpg")
book_8 = Book.create(title: "Rich Dad Poor Dad", pages: 207, year: 2000, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/91cBBjTizmL.jpg")
book_9 = Book.create(title: "There There", pages: 304, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/91lKQ1w00DL.jpg")
book_10 = Book.create(title: "Warlight", pages: 304, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/41hW%2BnDBJ7L._SX360_BO1,204,203,200_.jpg")
book_11 = Book.create(title: "The Immortalists", pages: 352, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51Hr9CCR8FL._SX329_BO1,204,203,200_.jpg")
book_12 = Book.create(title: "The Woman in the Window", pages: 240, year: 2018, thumbnail: "https://images-na.ssl-images-amazon.com/images/I/91ulS5E%2BmXL.jpg")
