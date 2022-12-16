# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def number_to_price(amount)
    number_to_currency(amount, unit: t('unit_for_price'))
  end
end
