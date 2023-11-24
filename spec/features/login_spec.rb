require 'rails_helper'

RSpec.feature 'User authentication', type: :feature do
  scenario 'User logs in' do
    user = create(:user, email: 'user@example.com', password: 'password')

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully') # Adjust to the content you expect after login
  end

  scenario 'User registers' do
    visit new_user_registration_path

    fill_in 'Name', with: 'New User'
    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully') # Adjust to the content you expect after registration
  end
end
