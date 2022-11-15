# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.bestsellers.decorate
    @latest_books = BookDecorator.decorate_collection(Book.first(3))
  end
end
