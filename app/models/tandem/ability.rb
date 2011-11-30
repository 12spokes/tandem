module Tandem
  class Ability
    include CanCan::Ability
    include Tandem::Configuration
  end
end
