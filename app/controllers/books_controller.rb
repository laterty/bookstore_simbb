# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @categories = Category.all
    @current_category_id = current_category_id
    @current_sort_type = current_sort_type
    @books = BooksQuery.new(query_params).query.includes(:authors).page(permitted_params[:page]).decorate
    @current_category_name = current_category_name
    @books_count = Book.count
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @book = Book.find(params[:id]).decorate
  end

  private

  def current_category_id
    session[:current_category_id] = permitted_params[:category_id] if permitted_params[:category_id]
    session[:current_category_id] || BooksQuery::DEFAULT_CATEGORY_ID
  end

  def current_category_name
    @categories.where(id: @current_category_id).name || Constants::Shared::DEFAULT_CATEGORY_NAME
  end

  def current_sort_type
    session[:current_sort_type] = permitted_params[:sort_type] if permitted_params[:sort_type]
    session[:current_sort_type] || BooksQuery::DEFAULT_ORDERS_TYPE
  end

  def query_params
    { category_id: @current_category_id, sort_type: @current_sort_type }
  end

  def permitted_params
    params.permit(:category_id, :sort_type, :page)
  end
end
