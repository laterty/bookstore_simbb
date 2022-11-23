# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.decorate
    @latest_books = BookDecorator.decorate_collection(Book.first(Constants::Shared::LATEST_BOOK_QUANTITY))
  end
end
