# frozen_string_literal: true

describe 'Change email' do
  let(:user) { create(:user) }
  let(:valid_email) { 'yolo@yolo.com' }
  let(:invalid_email) { 'yolo.com' }

  before { log_in(user) }

  describe 'Visitor change email to invalid email' do
    before do
      visit privacy_settings_path
      within '#change_email_form' do
        fill_in I18n.t('users.partials.change_email_form.label'), with: invalid_email
        click_button(I18n.t('users.partials.change_email_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path update_user_email_path
      expect(page).not_to have_content user.email
      expect(page).to have_content I18n.t('validation.email.invalid')
    end
  end

  describe 'Visitor change email to valid email' do
    before do
      visit privacy_settings_path
      within '#change_email_form' do
        fill_in I18n.t('users.partials.change_email_form.label'), with: valid_email
        click_button(I18n.t('users.partials.change_email_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path privacy_settings_path
      expect(page).not_to have_content valid_email
      expect(page).to have_content I18n.t('users.successful.update_email')
    end
    # CHECK how to check updating attributes while testing
    # expect(user.email).to eq valid_email # => false
  end
end
