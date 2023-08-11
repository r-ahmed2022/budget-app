require 'rails_helper'

RSpec.describe 'Entity', type: :feature do
  describe 'Index' do
    before(:each) do
      User.destroy_all
      Category.destroy_all
      Entity.destroy_all
      CategoryEntity.destroy_all

      @user1 = User.new(name: 'ali', password: '1234567', email: 'ali@gmail.com')
      @user1.save

      @category1 = @user1.categories.new(id: 43, name: 'Electronics', icon: 'test icon')
      @category1.save

      @entity1 = @user1.entities.new(id: 76, name: 'Check', amount: 50)
      @entity1.save

      @entity2 = @user1.entities.new(id: 75, name: 'Payment', amount: 40)
      @entity2.save

      @categoryentity1 = CategoryEntity.new(entity_id: 76, category_id: 43)
      @categoryentity2 = CategoryEntity.new(entity_id: 75, category_id: 43)

      @categoryentity1.save
      @categoryentity2.save

      visit new_user_session_path
      fill_in 'Email', with: 'ali@gmail.com'
      fill_in 'Password', with: '1234567'
      click_button 'Log In'
      click_on 'Electronics'
    end

    it 'should show the transactions page' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'should show the name of all my transactions' do
      expect(page).to have_content('Check')
      expect(page).to have_content('Payment')
    end

    it 'should show the total amount of each transaction' do
      expect(page).to have_content('$50.0')
      expect(page).to have_content('$40.0')
    end

    it 'should have a button to add transactions' do
      expect(page).to have_button('ADD TRANSACTION')
    end

    it 'should redirect to the add transaction page when clicking the add transaction button' do
      click_button 'ADD TRANSACTION'

      expect(page.current_path).to eq(new_category_entity_path(category_id: @category1.id))
    end

    it 'should be able to see the total amount of a category' do
      expect(page).to have_content('Total: $90.0')
    end
  end
end
