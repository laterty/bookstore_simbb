# frozen_string_literal: true

describe 'Change email' do
  before do
    @user = create(:user)
    log_in(@user)
    @valid_email = 'yolo@yolo.com'
    @invalid_email = 'yolo.com'
  end

  it 'Visitor change email to invalid email' do
    visit privacy_settings_path
    within '#change_email_form' do
      fill_in 'Enter email', with: @invalid_email
      click_button('Save')
    end
    expect(page).to have_current_path update_user_email_path, ignore_query: true
    expect(page).not_to have_content @user.email
    expect(page).to have_content 'Invalid email'
  end

  it 'Visitor change email to valid email' do
    visit privacy_settings_path
    within '#change_email_form' do
      fill_in 'Enter email', with: @valid_email
      click_button('Save')
    end
    expect(page).to have_current_path privacy_settings_path, ignore_query: true
    expect(page).not_to have_content @valid_email
    expect(page).to have_content 'Email was successfully changed!'
    # CHECK how to check updating attributes while testing
    # expect(@user.email).to eq @valid_email
  end
end
