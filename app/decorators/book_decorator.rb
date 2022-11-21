# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all

  def authors_names
    authors.pluck(:name).join(',')
  end
end
