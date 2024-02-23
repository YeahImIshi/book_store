class BooksController < ApplicationController
  def index
    @books = Book.includes(:genre).page(params[:page]).per(10)
    @books = @books.where("title LIKE ?", "#{params[:search]}%") if params[:search].present?
  end


  def show
    @book = Book.find(params[:id])
  end
end
