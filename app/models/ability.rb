class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # Guest user
  
      can :destroy, Post, user_id: user.id
      can :destroy, Post if user.role == 'admin'
    end
end
  