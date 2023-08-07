class User < ApplicationRecord
    attr_accessor :role

    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'only allows letters' }

    ROLES = %i[admin normaluser].freeze

    def is?(role)
      self.role == role.to_s
    end

    def set_default_value
      self.role ||= 'normaluser'
    end

    #def groups
    #  categories
    #end
end