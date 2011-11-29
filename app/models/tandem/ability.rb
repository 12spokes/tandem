module Tandem
  class Ability
    include CanCan::Ability
    def initialize(user)
      Tandem::initialize_abilities(user)
    end
  end
end
