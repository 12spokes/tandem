module Tandem
  class Page < ActiveRecord::Base
    has_many :contents
  end
end
