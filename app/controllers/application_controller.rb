# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :categories_all, :current_cart, :cart_count

  def categories_all
    @categories_all ||= Category.joins(:books)
                                .select('categories.*, COUNT(books.id) as books_count')
                                .group(:id)
  end

  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id]).decorate
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create.decorate
    session[:cart_id] = @current_cart.id
  end

  def cart_count
    @cart_count ||= @current_cart ? @current_cart.line_items.sum(&:quantity) : Constants::Shared::EMPTY_CART_ITEMS_COUNT
  end
end
