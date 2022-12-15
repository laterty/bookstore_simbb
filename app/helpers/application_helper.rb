# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def number_to_euro(amount)
    number_to_currency(amount, unit: t('unit_for_number_euro'))
  end
end
