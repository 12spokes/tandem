require 'spec_helper'

describe TandemContent do
  before(:each) do
    @valid_attributes = {
      :tandem_page_id => 1,
      :resource_type => "value for resource_type",
      :resource_id => 1,
      :token => "value for token"
    }
  end

  it "should create a new instance given valid attributes" do
    TandemContent.create!(@valid_attributes)
  end
end
