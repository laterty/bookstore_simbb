# frozen_string_literal: true

RSpec.describe 'review', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:review) { create(:review) }

  before do
    admin_log_in(admin_user)
  end

  describe 'index page content' do
    before { visit admin_reviews_path }

    it 'review item has book title' do
      expect(page).to have_text(review.book.title)
    end

    it 'review item has rating' do
      expect(page).to have_text(review.rating)
    end

    it 'review item has status' do
      expect(page).to have_text(review.status)
    end
  end

  context 'when admin click scopes links' do
    let(:result_current_path) { page.current_path }
    let(:unprocessed_link) { within('.scopes') { find('.unprocessed') } }
    let(:approve_button) { within('.action_items') { find_link(I18n.t('active_admin.reviews.buttons.approve')) } }
    let(:reject_button) { within('.action_items') { find_link(I18n.t('active_admin.reviews.buttons.reject')) } }

    context 'when click approve' do
      let(:unprocessed_review) { create(:review, status: 0) }

      before do
        visit admin_review_path(unprocessed_review)
        approve_button.click
      end

      it 'show message' do
        expect(page).to have_text(I18n.t('active_admin.reviews.notice.approved'))
      end
    end

    context 'when click reject' do
      let(:unprocessed_review) { create(:review, status: 0) }

      before do
        visit admin_review_path(unprocessed_review)
        reject_button.click
      end

      it 'show message' do
        expect(page).to have_text(I18n.t('active_admin.reviews.notice.rejected'))
      end
    end

    context 'when approve reviews it shows in approved tabs' do
      let!(:approved_review) { create(:review, status: 1) }
      let(:approved_link) { within('.scopes') { find('.approved') } }

      before do
        visit admin_reviews_path
        approved_link.click
      end

      it 'shows approved review in approved tab' do
        expect(page).to have_text(approved_review.title)
      end
    end

    context 'when reject reviews it shows in rejected tabs', js: true do
      let!(:rejected_review) { create(:review, status: 2) }
      let(:rejected_link) { within('.scopes') { find('.rejected') } }

      before do
        visit admin_reviews_path
        rejected_link.click
      end

      it 'shows rejected review in rejected tab' do
        expect(page).to have_text(rejected_review.title)
      end
    end
  end
end
