# frozen_string_literal: true

class HomeController < ApplicationController
  LATEST_BOOK_QUANTITY = 3

  def index
    @books = Book.all
    @latest_books = Book.first(LATEST_BOOK_QUANTITY)
  end
end
