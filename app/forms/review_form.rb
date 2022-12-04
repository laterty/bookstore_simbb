class ReviewForm < ApplicationForm
  MIN_RATING = 1
  MAX_RATING = 5
  RATING_RANGE = (MIN_RATING..MAX_RATING).freeze

  TITLE_CONTENT_REGEX = /\A[a-zA-Z0-9\W]+\Z/

  MAX_LENGTH_TITLE = 80
  MAX_LENGTH_CONTENT = 500

  attr_accessor :title, :content, :rating, :book_id, :user_id

  validates :title, :content, :rating, presence: true
  validates :rating, numericality: { in: RATING_RANGE }
  validates :title, length: { maximum: MAX_LENGTH_TITLE,
                              message: I18n.t('validation.review.length.title') },
                    format: { with: TITLE_CONTENT_REGEX,
                              message: I18n.t('validation.review.format.title') }
  validates :content, length: { maximum: MAX_LENGTH_CONTENT,
                                message: I18n.t('validation.review.length.content') },
                      format: { with: TITLE_CONTENT_REGEX,
                                message: I18n.t('validation.review.format.content') }
end
