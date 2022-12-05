# frozen_string_literal: true

RSpec.describe ReviewForm, type: :model do
  describe 'create' do
    let!(:current_user) { create(:user) }
    let!(:book) { create(:book) }
    let!(:valid_params) do
      {
        title: 'Title',
        content: 'Yolo polo colo tolo',
        rating: 5
      }
    end
    let!(:valid_review) { Review.find_or_initialize_by(user_id: current_user.id, book_id: book.id) }

    context 'when params is valid' do
      let!(:saved_review) { described_class.new(valid_review, valid_params).save }
      let!(:review_save?) { Review.pluck(:id).include?(saved_review.id) }

      it 'stores params attributes in corresponding review attributes' do
        valid_params.each do |key, value|
          expect(saved_review[key]).to eq(value)
        end
      end

      it 'save review' do
        expect(review_save?).to be_truthy
      end
    end

    context 'when params have invalid data' do
      let!(:saved_review) { described_class.new(valid_review, {}).save }

      it 'return nil when invalid params' do
        expect(saved_review).to be_nil
      end
    end
  end

  describe 'update' do
    let!(:review) { create(:review) }

    context 'when params valid' do
      let!(:valid_params) do
        { title: 'Changed title',
          content: review.rating,
          rating: review.rating }
      end

      let!(:updated_review) { described_class.new(review, valid_params).save }

      it 'update title' do
        expect(updated_review.title).to eq(valid_params[:title])
      end
    end
  end

  describe 'validation' do
    let!(:current_user) { create(:user) }
    let!(:initialized_review) { Review.find_or_initialize_by(user_id: current_user.id) }

    before { review_form.save }

    context 'when invalid format title' do
      let!(:invalid_format_title) { 'titleinvalid**##.._#@!@#@.' }
      let!(:params_invalid_format_title) { { title: invalid_format_title } }
      let!(:review_form) { described_class.new(initialized_review, params_invalid_format_title) }
      let(:has_error) { review_form.errors[:title].include?(I18n.t('validation.review.format.title')) }

      it 'validation title by regex' do
        expect(has_error).to be_truthy
      end
    end

    context 'when invalid length title' do
      let!(:invalid_length_title) { ('title' * 20).to_s }
      let!(:params_invalid_length_title) { { title: invalid_length_title } }
      let!(:review_form) { described_class.new(initialized_review, params_invalid_length_title) }
      let(:has_error) { review_form.errors[:title].include?(I18n.t('validation.review.length.title')) }

      it 'validation title by regex' do
        expect(has_error).to be_truthy
      end
    end

    context 'when invalid length content' do
      let!(:invalid_length_content) { ('length is too big' * 30).to_s }
      let!(:params_invalid_length_content) { { content: invalid_length_content } }
      let!(:review_form) { described_class.new(initialized_review, params_invalid_length_content) }
      let(:has_error) { review_form.errors[:content].include?(I18n.t('validation.review.length.content')) }

      it 'validation content by length' do
        expect(has_error).to be_truthy
      end
    end

    context 'when invalid format content' do
      let!(:invalid_format_content) { "contentinvalid**##.._\#@!@\#@." }
      let!(:params_invalid_format_content) { { content: invalid_format_content } }
      let!(:review_form) { described_class.new(initialized_review, params_invalid_format_content) }
      let(:has_error) { review_form.errors[:content].include?(I18n.t('validation.review.format.content')) }

      it 'validation content by length' do
        expect(has_error).to be_truthy
      end
    end
  end
end
