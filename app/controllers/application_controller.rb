# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :categories_all, :current_cart

  def categories_all
    @categories_all ||= Category.joins(:books)
                                .select('categories.*, COUNT(books.id) as books_count')
                                .group(:id)
  end

  private

  def current_cart
    restore_cart_from_session if session[:cart_id]

    new_cart unless session[:cart_id]
  end

  def restore_cart_from_session
    return session[:cart_id] = nil if cart.blank?

    @current_cart = cart.first.decorate
  end

  def new_cart
    @current_cart = Cart.create.decorate
    session[:cart_id] = @current_cart.id
  end

  def cart
    Cart.joins(:line_items)
        .where(id: session[:cart_id])
        .select('carts.*, COUNT(line_items.id) as line_items_count')
        .group(:id)
  end
end
