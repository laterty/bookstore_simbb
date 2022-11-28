# frozen_string_literal: true

describe 'Change password' do
  let(:user) { create(:user) }
  let(:empty_string) { '' }
  let(:current_password) { user.password }
  let(:invalid_password) { 'yolo12' }
  let(:new_password) { 'Yolo123*' }
  let(:invalid_confirmation_new_password) { 'yolO123*' }
  let(:valid_confirmation_new_password) { new_password }
  
  before { log_in(user) }

  it 'visitor puts empty values in all fields' do
    visit privacy_settings_path
    within '#change_password_form' do
      click_button(I18n.t('users.partials.change_password_form.submit_button'))
    end
    expect(page).to have_current_path update_user_password_path
    expect(page).to have_content "can't be blank"
  end

  it 'visitor puts empty values in old_passwords field' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: empty_string
      fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
      fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'), with: valid_confirmation_new_password
      click_button(I18n.t('users.partials.change_password_form.submit_button'))
    end
    expect(page).to have_current_path update_user_password_path
    expect(page).to have_content "can't be blank"
  end

  it 'visitor puts unequal passwords' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: current_password
      fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
      fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'), with: invalid_confirmation_new_password
      click_button(I18n.t('users.partials.change_password_form.submit_button'))
    end
    expect(page).to have_current_path update_user_password_path
    expect(page).to have_content 'Password confirmation should be the same with new password'
  end

  it 'visitor puts invalid new passwords' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: current_password
      fill_in I18n.t('users.partials.change_password_form.label.password'), with: invalid_password
      fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'), with: invalid_password
      click_button(I18n.t('users.partials.change_password_form.submit_button'))
    end
    expect(page).to have_current_path update_user_password_path
    expect(page).to have_content 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  it 'visitor puts wrong current password' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: invalid_password
      fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
      fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'), with: valid_confirmation_new_password
      click_button(I18n.t('users.partials.change_password_form.submit_button'))
    end
    expect(page).to have_current_path update_user_password_path
    expect(page).to have_content 'Wrong current password'
  end

  it 'visitor did everything right' do
    visit privacy_settings_path
    within '#change_password_form' do
      fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: current_password
      fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
      fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'), with: valid_confirmation_new_password
      click_button(I18n.t('users.partials.change_password_form.submit_button'))
    end
    expect(page).to have_current_path new_user_session_path
    expect(page).to have_content 'Password was successfully changed!'
  end
end
