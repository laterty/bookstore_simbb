# frozen_string_literal: true

class BooksController < ApplicationController
  protect_from_forgery except: :index

  def index
    @books = BooksQuery.new(Book.all, current_category).call(permitted_params).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def current_category
    session[:current_category] = params[:category] if params[:category]
    session[:current_category] || 'All'
  end

  def categorized_books
    params[:category] ? Book.where(category: params[:category]) : Book.all
  end

  def permitted_params
    params.permit(:category, :sort_direction,
                  :sort_type, :page)
  end
end
