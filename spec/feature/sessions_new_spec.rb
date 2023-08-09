require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  describe 'Visiting the login page' do
    before(:each) do
      User.destroy_all
      User.create(name: 'riyaz', email: 'riysaim@gmail.com', password: 'sadiq')

      visit new_user_session_path
    end

    it 'shoud have an email' do
      expect(assert_selector('input.s-email')).to eq(true)
    end

    it 'shoud have a password' do
      expect(assert_selector('input.s-password')).to eq(true)
    end

    it 'shoud have a login button' do
      expect(page).to have_button('Log In')
    end

    it 'should authenticate user when credentials are correct' do
      fill_in 'Email', with: 'riysaim@gmail.com'
      fill_in 'Password', with: 'sadiq'
      click_button 'Log In'

      expect(page.current_path).to eq(new_user_session_path)
    end
  end
end
