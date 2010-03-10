class TandemContent < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  
  accepts_nested_attributes_for :resource
  
  def build_resource(attributes)
    self.resource = TandemText.new(attributes)
  end
end
