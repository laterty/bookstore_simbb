# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :categories_all, :current_cart

  def categories_all
    @categories_all ||= Category.joins(:books).select('categories.*, COUNT(books.id) as books_count').group(:id)
  end

  def current_cart
    if session[:cart_id]
      cart = Cart.joins(:line_items).where(id: session[:cart_id]).select('carts.*, COUNT(line_items.id) as line_items_count').group(:id)
      if cart.present?
        @current_cart = cart.first.decorate
      else
        session[:cart_id] = nil
      end
    end
    return unless session[:cart_id].nil?

    @current_cart = Cart.create.decorate
    session[:cart_id] = @current_cart.id
  end
end
