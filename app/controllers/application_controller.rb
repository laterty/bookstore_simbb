# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :categories

  def categories
    @categories ||= Category.joins(:books).select('categories.*, COUNT(books.id) as books_count').group(:id)
  end
end
