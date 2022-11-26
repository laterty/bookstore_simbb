# frozen_string_literal: true

RSpec.describe 'Log in', type: :feature do
  let(:user) { create(:user) }

  describe 'Visitor logins successfully via log in form' do
    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button('Log in')
      end
    end

    it do
      expect(page).to have_current_path root_path, ignore_query: true
      expect(page).not_to have_content 'Log in'
      expect(page).to have_content 'Log out'
      expect(page).to have_content 'Signed in successfully.'
    end
  end

  describe 'Visitor forgots password' do
    before do
      visit new_user_session_path
      click_link('Forgot password?')
      within '#new_user' do
        fill_in 'user_email', with: user.email
        click_button('Email Instructions')
      end
    end

    it do
      expect(page).to have_current_path new_user_session_path, ignore_query: true
      expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
    end
  end
end
