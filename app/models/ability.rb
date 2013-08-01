class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role?(:admin)
      can :manage, :all
      can :read, :all
    
    elsif user.has_role?(:coach)
      can :create, TeamInvitation
      can :update, TeamInvitation do |i|
        i.team.coaches.include?(user)
      end
      can :destroy, TeamInvitation do |i|
        i.team.coaches.include?(user)
      end
      can :read, TeamInvitation do |i|
        i.team.coaches.include?(user)
      end

      can :manage, Team do |t|
        t.coaches.include?(user)
      end
      can :create, Team

      can :manage, DistanceEssential do |dc|
        dc.user_id == user.id
      end
      can :create, DistanceEssential

      can :read, User


    elsif user.has_role? :player
      can [:show, :update], User, :id => user.id

      can :manage, DistanceEssential do |dc|
        dc.user_id == user.id
      end

      can :read, Team do |t|
        t.users.include?(user)
      end
      can :create, DistanceEssential
    else
      #can :read, :all
      can :create, User
    end
   
     
    #if user.has_role? :admin
    # can :manage, Distance_essentials
    #else
    # can [:read, :create], Distance_essentials
    #  can [:edit, :destroy], Distance_essentials, :user_id => user.id
    #end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
