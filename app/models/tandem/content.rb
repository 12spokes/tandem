module Tandem
  class Content < ActiveRecord::Base
    belongs_to :page

    validates_presence_of :page_id, :type
    #enforce abstract class architecture
    validates_exclusion_of :type, :in => [self.name]
  end
end
