Tandem::Configuration.current_user_proc {
  User.find(session['user_id']) unless session['user_id'].blank?
}
Tandem::Configuration.user_abilities_proc { |user|
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

  can :manage, :all
  #can :manage, Page
  #can :read, Page

  #can :manage, Content
  #can :update, Content
  #can :read, Content
}

# Change this to move your layouts directory from /app/views/layouts/tandem
# Tandem::Configuration.layouts_dir = 'tandem'

# By default, tandem will redirect a user back to the engine mount point "/tandem" on
# an authentication error. This can cause an infinite loop if for example
# PageController#index is not readable by all users. Uncomment this to redirect to the
# app root instead.
# Tandem::Configuration.unauthoried_path = '/'

