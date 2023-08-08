class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_entities, foreign_key: 'category_id', class_name: 'CategoryEntity', dependent: :delete_all

  validates :name, presence: true
  validates :icon, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
  before_validation :set_default_value
  def date
    "#{created_at.day}/#{created_at.month}/#{created_at.year}"
  end

  def total
    "$#{total_amount}"
  end

  def set_default_value
    self.total_amount ||= 0.0
  end
end
