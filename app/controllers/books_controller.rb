class BooksController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    bp = book_params
    unless bp[:thumbnail]
      bp[:thumbnail] = 'src="../images/irish_book.jpg"'
    end
    authors = bp[:authors].split(',')
    arr = []
    authors.each do |author|
      arr << Author.find_or_create_by(name: author.titlecase)
    end
    bp[:authors] = arr
    @book = Book.create(bp)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :year, :authors, :thumbnail)
  end
end
