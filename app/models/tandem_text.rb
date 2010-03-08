class TandemText < ActiveRecord::Base
  has_one :tandem_content, :as => :resource
end
