# frozen_string_literal: true

RSpec.describe 'review', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:review) { create(:review) }
  let!(:second_review) { create(:review) }

  before do
    admin_log_in(admin_user)
  end

  describe 'index page content' do
    before { visit admin_reviews_path }

    it 'review item has title' do
      expect(page).to have_text(review.title)
    end

    it 'review item has id' do
      expect(page).to have_text(review.id)
    end

    it 'review item has book id' do
      expect(page).to have_text(review.user.id)
    end

    it 'review item has user id' do
      expect(page).to have_text(review.book.id)
    end

    it 'review item has status' do
      expect(page).to have_text(review.status)
    end
  end

  context 'when admin click scopes links' do
    let(:result_current_path) { page.current_path }
    let(:unprocessed_link) { within('.scopes') { find('.unprocessed') } }
    let(:approve_button) { within('.action_items') { find_link('Approve') } }
    let(:reject_button) { within('.action_items') { find_link('Reject') } }

    context 'when click approve' do
      before do
        visit admin_review_path(review)
        approve_button.click
      end

      it 'show message' do
        expect(page).to have_text(I18n.t('active_admin.reviews.notice.approved'))
      end
    end

    context 'when click reject' do
      before do
        visit admin_review_path(second_review)
        reject_button.click
      end

      it 'show message' do
        expect(page).to have_text(I18n.t('active_admin.reviews.notice.rejected'))
      end
    end

    context 'when approve reviews it shows in approved tabs' do
      let(:approved_link) { within('.scopes') { find('.approved') } }

      before do
        visit admin_reviews_path
        approved_link.click
      end

      it 'shows approved review in approved tab' do
        expect(page).to have_text(review.title)
      end
    end

    context 'when reject reviews it shows in rejected tabs' do
      let(:rejected_link) { within('.scopes') { find('.rejected') } }

      before do
        visit admin_reviews_path
        rejected_link.click
      end

      it 'shows rejected review in rejected tab' do
        expect(page).to have_text(second_review.title)
      end
    end
  end
end
