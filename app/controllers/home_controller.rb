class HomeController < ApplicationController
  def index
    @books = Book.all
    @latest_books = Book.first(3)
  end
end
