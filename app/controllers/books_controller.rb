class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new()
  end

  def create
    bp = book_params
    authors = bp[:authors].split(',')
    arr = []
    authors.each do |author|
        arr << Author.find_or_create_by(name: author.titlecase)
      end
      bp[:authors] = arr
      Book.create(bp)
      redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :year, :authors)
  end
end
