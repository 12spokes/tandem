module ControllerHacks
  def get(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "GET")
  end

  # Executes a request simulating POST HTTP method and set/volley the response
  def post(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "POST")
  end

  # Executes a request simulating PUT HTTP method and set/volley the response
  def put(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "PUT")
  end

  # Executes a request simulating DELETE HTTP method and set/volley the response
  def delete(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "DELETE")
  end

  private

  def process_action(action, parameters = nil, session = nil, flash = nil, method = "GET")
    parameters ||= {}
    process(action, parameters.merge!(:use_route => :tandem), session, flash, method)
  end
end

# This will include the routing helpers in the specs so that we can use
# forum_path, forum_topic_path and so on to get to the routes.
RSpec.configure do |config|
  config.include Tandem::Engine.routes.url_helpers
  #config.include ControllerHacks, :type => :controller
  Tandem::Engine.load_engine_routes
end