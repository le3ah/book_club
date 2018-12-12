class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = Review.where("user_id = ?", params[:id])
      if params[:sort] == "reviews_newest"
        @reviews = @reviews.newest
      elsif params[:sort] == "reviews_oldest"
        @reviews = @reviews.oldest
      end
  end
end
