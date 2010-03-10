require File.dirname(__FILE__) + '/../spec_helper'

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
  
  describe 'associations' do
    it 'should have many TandemContents' do
      TandemPage.reflect_on_association(:tandem_contents).should_not be_nil
      TandemPage.reflect_on_association(:tandem_contents).macro.should eql(:has_many)
    end
  end
end
