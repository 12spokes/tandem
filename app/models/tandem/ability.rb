module Tandem
  class Ability
    include CanCan::Ability
    def initialize(user)
      raise(ConfigurationNotFound.new("Tandem::Ability.initialize",'<method>'))
    end
  end
end
