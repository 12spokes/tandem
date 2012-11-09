module Tandem
  module ControllerRequests
    [:get, :post, :put, :delete].each do |verb|
      define_method verb do |action, parameters = nil, session = nil, flash = nil|
        process_action(action, parameters, session, flash, verb.to_s.upcase)
      end
    end

    private
    def process_action(action, parameters = nil, session = nil, flash = nil, method = "GET")
      parameters ||= {}
      process(action, parameters.merge!(:use_route => :tandem), session, flash, method)
    end
  end
end
