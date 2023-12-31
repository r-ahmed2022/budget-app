class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_entities, foreign_key: 'entity_id', class_name: 'CategoryEntity', dependent: :delete_all

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  def date
    "#{created_at.day}/#{created_at.month}/#{created_at.year}"
  end

  def total
    "$#{amount}"
  end
end
