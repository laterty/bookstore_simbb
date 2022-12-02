# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all
  SHORT_DESCRIPTION_LENGTH = 250

  def authors_names
    authors.pluck(:name).join(',')
  end

  def short_description
    description.truncate(SHORT_DESCRIPTION_LENGTH)
  end
end
