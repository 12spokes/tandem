module Tandem

  require 'spec_helper'

  describe Page do
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
      Page.create!(@valid_attributes)
    end

    describe 'associations' do
      it 'should have many TandemContents' do
        Page.reflect_on_association(:contents).should_not be_nil
        Page.reflect_on_association(:contents).macro.should eql(:has_many)
      end
    end
  end
end