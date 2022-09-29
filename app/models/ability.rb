class Ability
  include CanCan::Ability

  def initialize(user)
    can :read
    return unless user.present?

    # can :read, :all
    # can :manage, Post, author: user
    # can :manage, Comment, author: user



    return unless user.role == 'admin'

    can :manage, :all
  end
end
