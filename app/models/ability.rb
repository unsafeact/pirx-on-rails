class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, Order, user_id: user.id

    if user.admin?
      can :manage, all
    else
      can [:read, :edit, :update, :destroy], User, id: user.id
      can :read, Product
      can :manage, Order, user_id: user.id
    end

  end

end
