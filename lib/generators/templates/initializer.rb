Tandem::Configuration.current_user_proc {
  # Uncomment and/or modify the following line once your project has a user model to
  # derive abilities from
  # User.find(session['user_id']) unless session['user_id'].blank?
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

# By default, tandem will redirect a user back to the engine mount point "/tandem" on
# an authentication error. This can cause an infinite loop if for example
# PageController#index is not readable by all users. Uncomment this to redirect to the
# app root instead.
# Tandem::Configuration.unauthorized_path = '/'

# Change this to move your layouts directory from /app/views/layouts/tandem
# Tandem::Configuration.layouts_dir = 'tandem'

# Change this to move your uploaded images directory from /public/assets/images/...
# Tandem::Configuration.uploaded_images_dir = ":rails_root/public"

# Change this to modify your uploaded images directory structure & routing from /public/assets/images/1/original/...
# Tandem::Configuration.uploaded_images_template = "/assets/images/:id/:style/:basename.:extension"

# Override Tandem's default paperclip options
# For example, to use S3, add the aws-sdk gem to your gemfile and uncomment the following
# Tandem::Configuration.paperclip_options = { :styles => { :thumb => "150x150>" },
                                             #:storage => :s3,
                                             #:bucket => Proc.new { Rails.application.engine_name.gsub(/application$/, Rails.env) },
                                             #:s3_credentials => {
                                                                   #:access_key_id => ENV['S3_KEY'],
                                                                   #:secret_access_key => ENV['S3_SECRET']
                                             #} }
