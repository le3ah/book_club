class BooksController < ApplicationController
  def index
    @books = Book.all
    @users = User.all

    if params[:sort] == "avg_rating_ASC"
      @books = @books.highest_rated_average('ASC')
    elsif params[:sort] == "avg_rating_DESC"
      @books = @books.highest_rated_average('DESC')
    elsif params[:sort] == "num_pages_ASC"
      @books = @books.num_pages_sort('ASC')
    elsif params[:sort] == "num_pages_DESC"
      @books = @books.num_pages_sort('DESC')
    elsif params[:sort] == "num_reviews_ASC"
      @books = @books.sort_reviews_number('ASC')
    elsif params[:sort] == "num_reviews_DESC"
      @books = @books.sort_reviews_number('DESC')
    end

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
