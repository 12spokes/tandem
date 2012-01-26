require File.expand_path('../../../../../lib/generators/templates/initializer.rb', __FILE__)

module Tandem
  #override the default configuration
  Configuration.current_user_proc {
    User.find(session['user_id']) unless session['user_id'].blank?
  }
end


