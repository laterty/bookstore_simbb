# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.all
    @latest_books = Book.first(Constants::Shared::LATEST_BOOK_QUANTITY)
  end
end
