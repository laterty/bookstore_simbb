# frozen_string_literal: true

class BookImageUploader < ApplicationUploader
  ALLOWED_IMAGE_FORMATS = %w[jpg jpeg gif png].freeze
  DEFAULT_IMAGE_URL = 'default_book_image.png'

  def default_url(*)
    DEFAULT_IMAGE_URL
  end

  def extension_allowlist
    ALLOWED_IMAGE_FORMATS
  end
end
