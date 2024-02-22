class BooksController < ApplicationController
  def index
    @books = Book.includes(:genre).all
  end

  def show
    @book = Book.find(params[:id])
  end
end
