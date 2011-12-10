module Tandem
  class Page < ActiveRecord::Base
    has_many :contents

    validates_uniqueness_of :link_label
  end
end
