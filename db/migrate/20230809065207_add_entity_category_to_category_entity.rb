class AddEntityCategoryToCategoryEntity < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_entities, :entity, null: false, foreign_key: true
    add_reference :category_entities, :category, null: false, foreign_key: true
  end
end
