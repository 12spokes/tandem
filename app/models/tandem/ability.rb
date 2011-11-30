module Tandem
  class Ability
    include CanCan::Ability
    define_method :initialize, Configuration.user_abilities
  end
end
