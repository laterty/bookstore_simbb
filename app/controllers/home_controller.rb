# frozen_string_literal: true

class HomeController < ApplicationController
  LATEST_BOOK_QUANTITY = 3

  def index
    @books = Book.all.decorate
    @latest_books = BookDecorator.decorate_collection(Book.first(LATEST_BOOK_QUANTITY))
  end
end
