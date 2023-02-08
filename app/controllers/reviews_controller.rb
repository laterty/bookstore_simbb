# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    if review_form.save
      redirect_to_book(type: :notice, message: I18n.t('books.partials.reviews.successful'))
    else
      redirect_to_book(type: :alert, message: review_form.errors.full_messages.join('; '))
    end
  end

  private

  def review_form
    @review_form ||= ReviewForm.new(review, permitted_params)
  end

  def review
    @review ||= Review.new(permitted_params)
  end

  def redirect_to_book(type:, message:)
    flash[type] = message
    redirect_to book_path(permitted_params[:book_id])
  end

  def permitted_params
    params.require(:review).permit(:title, :content, :rating, :book_id).merge(user_id: current_user.id)
  end
end
