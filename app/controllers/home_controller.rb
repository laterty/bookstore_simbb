# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.decorate
    @latest_books = Book.limit(Constants::Shared::LATEST_BOOK_QUANTITY).decorate
  end
end
