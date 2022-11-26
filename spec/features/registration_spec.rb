# frozen_string_literal: true

describe 'Registration' do
  it 'Visitor registers successfully via register form' do
    visit new_user_registration_path
    within '#new_user' do
      fill_in I18n.t('devise.registrations.new.label.email'), with: Faker::Internet.safe_email
      fill_in I18n.t('devise.registrations.new.label.password'), with: 'Yo12*lo34'
      fill_in I18n.t('devise.registrations.new.label.password_confirmation'), with: 'Yo12*lo34'
      click_button(I18n.t('devise.registrations.new.submit_button'))
    end
    expect(page).to have_current_path root_path, ignore_query: true
    expect(page).not_to have_content I18n.t('layouts.header.sign_in')
    expect(page).not_to have_content I18n.t('layouts.header.sign_up')
    expect(page).to have_content I18n.t('layouts.header.log_out')
    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end
end
