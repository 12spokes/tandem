require File.dirname(__FILE__) + '/../spec_helper'

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
  
  describe 'associations' do
    it 'should belong_to a resource' do
      TandemContent.reflect_on_association(:resource).should_not be_nil
      TandemContent.reflect_on_association(:resource).macro.should eql(:belongs_to)
      TandemContent.reflect_on_association(:resource).options.should include(:polymorphic => true)
    end
    
    it 'should belong to a tandem_page' do
      TandemContent.reflect_on_association(:tandem_page).should_not be_nil
      TandemContent.reflect_on_association(:tandem_page).macro.should eql(:belongs_to)
    end
  end
end
