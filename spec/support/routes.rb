# This will include the routing helpers in the specs so that we can use
# forum_path, forum_topic_path and so on to get to the routes.
RSpec.configure do |config|
  config.include Tandem::Engine.routes.url_helpers
  Tandem::Engine.load_engine_routes
end