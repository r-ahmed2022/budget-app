class CategoryEntity < ApplicationRecord
  after_create :increase_category_total_amount

  belongs_to :entity, class_name: 'Entity'
  belongs_to :category, class_name: 'Category'

  private

  def increase_category_total_amount
    category.increment!(:total_amount, entity.amount)
  end
end
