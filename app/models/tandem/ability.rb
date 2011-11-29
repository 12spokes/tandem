module Tandem
  class Ability
    include CanCan::Ability
    include Tandem::AbilityConfig
  end
end
