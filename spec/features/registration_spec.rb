RSpec.describe 'Registration process', type: :feature do
    before do
      # Setup any prerequisite data or actions here
    end
  
    it 'allows a user to register' do
      visit new_user_registration_path
  
      # Use Capybara to interact with the registration form and submit
      fill_in 'Name', with: 'New User'
      fill_in 'Email', with: 'new_user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
  
      expect(page).to have_content('Welcome') # Adjust to the content you expect after registration
    end
  end