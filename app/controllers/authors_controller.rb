class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    books = @author.books
    books.each do |book|
      book.destroy
      if book.authors.count < 2
      end
      @author.destroy
    end
    redirect_to books_path
  end
end
