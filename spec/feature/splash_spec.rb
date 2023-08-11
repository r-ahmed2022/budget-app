require 'rails_helper'

RSpec.describe 'Splash screen', type: :feature do
  describe 'Visiting the splash screen' do
    before :each do
      visit unauthenticated_root_path
    end

    it 'should be in the splash screen' do
      expect(page.current_path).to eq('/')
    end

    it 'should have a login link' do
      expect(page).to have_link('Log In')
    end

    it 'should have a signup link' do
      expect(page).to have_link('Sign Up')
    end

    it 'should redirect to login page if press the login link' do
      click_link 'Log In'
      expect(page.current_path).to eq(new_user_session_path)
    end

    it 'should redirect to signup page if press the signup link' do
      click_link 'Sign Up'
      expect(page.current_path).to eq(new_user_registration_path)
    end
  end
end