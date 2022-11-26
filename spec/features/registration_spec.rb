# frozen_string_literal: true

describe 'Registration' do
  it 'Visitor registers successfully via register form' do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'Email', with: Faker::Internet.safe_email
      fill_in 'Password', with: 'Yo12*lo34'
      fill_in 'Confirm password', with: 'Yo12*lo34'
      click_button('Sign up')
    end
    expect(page).to have_current_path root_path, ignore_query: true
    expect(page).not_to have_content 'Sign up'
    expect(page).to have_content 'Log out'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
