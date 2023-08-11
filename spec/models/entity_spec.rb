require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'validations' do
    it 'should validate presence of name' do
      entity = Entity.new(name: '')
      expect(entity.valid?).to be false
      expect(entity.errors[:name]).to include("can't be blank")
    end

    it 'should validate presence of amount' do
      entity = Entity.new(amount: '')
      entity.valid?
      expect(entity.errors[:amount]).to include('is not a number')
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      entity = Entity.reflect_on_association(:author)
      expect(entity.macro).to eq(:belongs_to)
    end
  end
end
