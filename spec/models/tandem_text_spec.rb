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
  
  describe 'associations' do
    it 'should have one tandem_content' do
      TandemText.reflect_on_association(:tandem_content).should_not be_nil
      TandemText.reflect_on_association(:tandem_content).macro.should eql(:has_one)
      TandemText.reflect_on_association(:tandem_content).options.should include(:as => :resource)
    end
  end
end
