class AuthorsController < ApplicationController
  def show
    @authors = Author.find(params[:id])
  end
end
