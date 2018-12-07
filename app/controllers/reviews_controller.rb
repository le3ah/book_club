class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new()
  end

  def create
    rp = review_params
    User.find_or_create_by(name: rp[:user])
    @book = Book.find(params[:book_id])
    @book.reviews.create(rp)

    redirect_to new_book_review_path
  end

  private

  def review_params
    params.require(:review).permit(:user, :title, :description, :rating, :book_id)
  end

end
