# frozen_string_literal: true

describe 'Change password' do
  before do
    @user = create(:user)
    log_in(@user)
    @current_password = @user.password
    @invalid_password = 'yolo12'
    @new_password = 'Yolo123*'
    @invalid_confirmation_new_password = 'yolO123*'
    @valid_confirmation_new_password = @new_password
  end

  it 'visitor puts empty values in all fields' do
    visit privacy_settings_path
    within '#change_password_form' do
      click_button('Save')
    end
    expect(page).to have_current_path update_user_password_path, ignore_query: true
    expect(page).to have_content "can't be blank"
  end

  it 'visitor puts empty values in old_passwords field' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in 'Old password', with: ''
      fill_in 'New password', with: @new_password
      fill_in 'Confirm password', with: @valid_confirmation_new_password
      click_button('Save')
    end
    expect(page).to have_current_path update_user_password_path, ignore_query: true
    expect(page).to have_content "can't be blank"
  end

  it 'visitor puts unequal passwords' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in 'Old password', with: @current_password
      fill_in 'New password', with: @new_password
      fill_in 'Confirm password', with: @invalid_confirmation_new_password
      click_button('Save')
    end
    expect(page).to have_current_path update_user_password_path, ignore_query: true
    expect(page).to have_content 'Password confirmation should be the same with new password'
  end

  it 'visitor puts invalid new passwords' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in 'Old password', with: @current_password
      fill_in 'New password', with: @invalid_password
      fill_in 'Confirm password', with: @invalid_password
      click_button('Save')
    end
    expect(page).to have_current_path update_user_password_path, ignore_query: true
    expect(page).to have_content 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  it 'visitor puts wrong current password' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in 'Old password', with: @invalid_password
      fill_in 'New password', with: @new_password
      fill_in 'Confirm password', with: @valid_confirmation_new_password
      click_button('Save')
    end
    expect(page).to have_current_path update_user_password_path, ignore_query: true
    expect(page).to have_content 'Wrong current password'
  end

  it 'visitor did everything right' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in 'Old password', with: @current_password
      fill_in 'New password', with: @new_password
      fill_in 'Confirm password', with: @valid_confirmation_new_password
      click_button('Save')
    end
    expect(page).to have_current_path new_user_session_path, ignore_query: true
    expect(page).to have_content 'Password was successfully changed!'
  end
end
