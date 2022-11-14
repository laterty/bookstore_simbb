# frozen_string_literal: true

class BooksQuery
  attr_accessor :initial_scope, :category

  def initialize(initial_scope, category = 'All')
    @initial_scope = initial_scope
    @category = category
  end

  def call(params)
    scoped = category == 'All' ? initial_scope : filter_by_category(initial_scope, category)
    sort(scoped, params[:sort_type] || :price, params[:sort_direction] || :desc)
  end

  private

  def filter_by_category(scoped, category = nil)
    category ? scoped.where(category:) : scoped
  end

  def sort(scoped, sort_type, sort_direction)
    scoped.order(sort_type => sort_direction)
  end
end
