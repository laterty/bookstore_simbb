# frozen_string_literal: true

class BooksQuery
  PRICE_ASC = 'price ASC'
  PRICE_DESC = 'price DESC'
  YEAR_OF_PUBLICATION_DESC = 'year_of_publication DESC'
  DEFAULT_CATEGORY_ID = 0

  ORDERS_TYPE = {
    price_asc: PRICE_ASC,
    price_desc: PRICE_DESC,
    year_of_publication_desc: YEAR_OF_PUBLICATION_DESC
  }.freeze

  DEFAULT_ORDERS_TYPE = YEAR_OF_PUBLICATION_DESC

  def initialize(params)
    @category_id = params[:category_id]
    @sort_type = generate_order(params[:sort_type]&.to_sym)
  end

  def query
    filtered_scope = filtered_scope(base_scope)
    sorted_scope(filtered_scope)
  end

  private

  attr_reader :category_id, :sort_type

  def filtered_scope(scope)
    valid_category? ? scope.where(category_id:) : scope
  end

  def sorted_scope(scope)
    scope.order(sort_type)
  end

  def valid_category?
    category_id.present? && Category.exists?(id: category_id)
  end

  def base_scope
    @base_scope ||= Book.all
  end

  def generate_order(sort_type)
    ORDERS_TYPE[sort_type] || DEFAULT_ORDERS_TYPE
  end
end
