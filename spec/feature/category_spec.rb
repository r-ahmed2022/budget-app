require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  before :each do
    @user = User.new(name: 'riyaz', email: 'riysaim@gmail.com', password: 'sadiq123',
                     password_confirmation: 'sadiq123')

    @user.save

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
  end

  it 'should display the categories page' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'should display add new category button' do
    expect(page).to have_content('ADD CATEGORY')
  end

  it 'should display the category form' do
      expect(page).to have_content('ADD CATEGORY')
  end
end