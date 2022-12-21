# frozen_string_literal: true

module Helper
  module DefaultBookImageHelper
    def default_book_image
      File.basename(BookImageUploader::DEFAULT_IMAGE_URL, File.extname(BookImageUploader::DEFAULT_IMAGE_URL))
    end
  end
end
