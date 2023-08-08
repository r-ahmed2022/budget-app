# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new
    if user.is?(:admin)
      can :manage, :all
    else
      can :manage, Category, author_id: user.id
      can :create, Category, author_id: user.id
      can :edit, Category, author_id: user.id
      #can :destroy, Entity, author_id: user.id
      #can :manage, Entity, author_id: user.id
      #can :create, Entity, author_id: user.id
      #can :edit, Entity, author_id: user.id
      #can :destroy, Entity, author_id: user.id
      can :read, :all
    end
  end
end
