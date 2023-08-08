class CreateCategoryEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :category_entities do |t|

      t.timestamps
    end
  end
end
