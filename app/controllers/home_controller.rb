# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.bestsellers
    @latest_books = Book.first(3)
  end
end
