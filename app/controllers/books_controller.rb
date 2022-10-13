class BooksController < ApplicationController
  def index
    return @books = Book.categorized_books(params[:category]) if params[:category] && category?

    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def category?
    Book::CATEGORIES.value?(params[:category])
  end
end
