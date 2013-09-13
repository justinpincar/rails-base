class Ability
  include CanCan::Ability

  def initialize(user)
    # Needs to be class variable for use inside blocks.
    @user = user

    if @user.present?
      if @user.admin?
        can :manage, :all
        can :impersonate, User
      end

      can :manage, User, {:id => @user.id}
    end
  end
end

