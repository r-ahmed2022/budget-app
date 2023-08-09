class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, foreign_key: 'author_id', dependent: :destroy
  has_many :entities, foreign_key: 'author_id', class_name: 'Entity', dependent: :delete_all
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'only allows letters' }

  ROLES = %i[admin normaluser].freeze

  def is?(role)
    self.role == role.to_s
  end

  def set_default_value
    self.role ||= 'normaluser'
  end

  # def groups
  #  categories
  # end
end
