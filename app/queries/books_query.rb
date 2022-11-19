# frozen_string_literal: true

class BooksQuery
  attr_reader :category, :sort_type

  PRICE_ASC = 'price ASC'
  PRICE_DESC = 'price DESC'
  YEAR_OF_PUBLICATION_DESC = 'year_of_publication DESC'

  ORDERS_TYPE = {
    price_asc: PRICE_ASC,
    price_desc: PRICE_DESC,
    year_of_publication_desc: YEAR_OF_PUBLICATION_DESC
  }.freeze

  DEFAULT_ORDERS_TYPE = YEAR_OF_PUBLICATION_DESC

  def initialize(params)
    @category = params[:category]
    @sort_type = generate_order(params[:sort_type]&.to_sym)
  end

  def query
    scope = base_scope
    scope = filtered_scope(scope)
    sorted_scope(scope)
  end

  private

  def filtered_scope(scope)
    valid_category? ? scope.where(category:) : scope
  end

  def sorted_scope(scope)
    scope.order(sort_type)
  end

  def valid_category?
    category && Category.exists?(category)
  end

  def base_scope
    Book.all
  end

  def generate_order(sort_type)
    ORDERS_TYPE[sort_type] || DEFAULT_ORDERS_TYPE
  end
end
