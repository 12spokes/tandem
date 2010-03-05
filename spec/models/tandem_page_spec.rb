require 'spec_helper'

describe TandemPage do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :token => "value for token",
      :layout => "value for layout",
      :parent_id => 1,
      :keywords => "value for keywords",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    TandemPage.create!(@valid_attributes)
  end
end
