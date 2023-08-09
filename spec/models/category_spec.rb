require 'rails_helper'

RSpec.describe Category, type: :model do
  fixtures :users
  describe 'validations' do
    it 'should validate presence of name' do
      category = Category.new(name: '')
      expect(category.valid?).to be false
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'should validate presence of icon' do
      user = users(:userA)
      category = user.categories.new(name: 'Riyaz')
      expect(category).not_to be_valid
      expect(category.errors[:icon]).to include("can't be blank")
      category = user.categories.new(name: 'Riyaz', icon: 'home.svg')
      expect(category).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      category = Category.reflect_on_association(:author)
      expect(category.macro).to eq(:belongs_to)
    end
  end
end
