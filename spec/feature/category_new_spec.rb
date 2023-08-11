require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  describe 'New' do
    before(:each) do
      User.destroy_all
      Category.destroy_all

      @user1 = User.new(name: 'ali', password: '1234567', email: 'ali@gmail.com')
      @user1.save

      visit new_user_session_path
      fill_in 'Email', with: 'ali@gmail.com'
      fill_in 'Password', with: '1234567'
      click_button 'Log In'
      click_button 'ADD CATEGORY'
    end

    it 'should show the add categories page' do
      expect(page).to have_content('ADD CATEGORY')
    end

    it 'should have a name input' do
      expect(assert_selector('input.category-name')).to eq(true)
    end

    it 'should have a icon input' do
      expect(assert_selector('input.category-icon')).to eq(true)
    end

    it 'should have sign up button' do
      expect(page).to have_button('Save')
    end

    it 'should create a category when credentials are correct' do
      fill_in 'Name', with: 'Music'
      fill_in 'Icon URL', with: 'https//unsplash.com/weweew12'
      click_button 'Save'

      expect(page).to have_content('Music')
    end
  end
end