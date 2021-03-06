class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    #   can :update, Article, :published => true
    alias_action(:update, :delete, :edit, to: :modify)

    can(:modify, Idea) do |idea|
      idea.user == user
    end

    can(:delete, Review) do |review|
      review.user == user
    end
    
  end
end
