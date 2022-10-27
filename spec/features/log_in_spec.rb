feature 'log in' do
  background do
    @user = FactoryBot.create(:user)
  end

  scenario 'Visitor logins successfully via log in form' do
    visit new_user_session_path
    within '#new_user' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button('Log in')
    end
    expect(page.current_path).to eq root_path
    expect(page).not_to have_content 'Log in'
    expect(page).to have_content 'Log out'
    expect(page).to have_content 'Signed in successfully.'
  end
end
