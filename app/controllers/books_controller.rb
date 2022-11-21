# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @current_category = current_category
    @current_sort_type = current_sort_type
    @books = BooksQuery.new(query_params).query.includes(:authors).page(permitted_params[:page]).decorate
    @books_count = Book.count
    @categories = Category.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @book = Book.find(params[:id]).decorate
  end

  private

  def current_category
    session[:current_category] = permitted_params[:category] if permitted_params[:category]
    session[:current_category] || BooksQuery::DEFAULT_CATEGORY
  end

  def current_sort_type
    session[:current_sort_type] = permitted_params[:sort_type] if permitted_params[:sort_type]
    session[:current_sort_type] || BooksQuery::DEFAULT_ORDERS_TYPE
  end

  def query_params
    { category: @current_category, sort_type: @current_sort_type }
  end

  def permitted_params
    params.permit(:category, :sort_type, :page)
  end
end
