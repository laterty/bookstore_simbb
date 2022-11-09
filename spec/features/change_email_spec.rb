feature 'Change email' do
  background do
    @user = FactoryBot.create(:user)
    log_in(@user)
    @valid_email = 'yolo@yolo.com'
    @invalid_email = 'yolo.com'
  end

  scenario 'Visitor change email to invalid email' do
    visit privacy_settings_path
    within '#change_email_form' do
      fill_in 'Enter email', with: @invalid_email
      click_button('Save')
    end
    expect(page.current_path).to eq update_user_email_path
    expect(page).not_to have_content @user.email
    expect(page).to have_content 'Invalid email'
  end

  scenario 'Visitor change email to valid email' do
    visit privacy_settings_path
    within '#change_email_form' do
      fill_in 'Enter email', with: @valid_email
      click_button('Save')
    end
    expect(page.current_path).to eq privacy_settings_path
    expect(page).not_to have_content @valid_email
    expect(page).to have_content 'Email was successfully changed!'
    # CHECK how to check updating attributes while testing
    # expect(@user.email).to eq @valid_email
  end
end
