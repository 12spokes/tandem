class TandemContent < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  belongs_to :tandem_page
  
  accepts_nested_attributes_for :resource
  
  def build_resource(attributes)
    self.resource = TandemText.new(attributes)
  end
end
