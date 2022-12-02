# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :categories_all

  def categories_all
    @categories_all ||= Category.joins(:books).select('categories.*, COUNT(books.id) as books_count').group(:id)
  end
end
