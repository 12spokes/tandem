require File.expand_path('../../../../../lib/generators/templates/initializer.rb', __FILE__)

module Tandem
  #override the default configuration
  Configuration.current_user_proc { |request|
    User.find(request.session['user_id']) unless request.session['user_id'].blank?
  }
end


