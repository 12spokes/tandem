require 'spec_helper'

describe TandemText do
  before(:each) do
    @valid_attributes = {
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    TandemText.create!(@valid_attributes)
  end
end
