class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :destroy, User if user.admin?

    can :manage, Order, user_id: user.id
    can :destroy, Comment if user.admin?
  end

end
