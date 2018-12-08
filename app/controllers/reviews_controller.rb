class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new()
  end

  def create
    rp = review_params
    @user = User.find_or_create_by(name: rp[:user])
    @book = Book.find(params[:book_id])
    @book.reviews.create(rp)
    @review.book_id = @book.id
    @review.user_id = @user.id

    if @review.save
      redirect_to book_path(@review.book)
    else
      render :new
    end 
  end

  private

  def review_params
    params.require(:review).permit(:user, :title, :description, :rating, :book_id)
  end

end
