module Tandem

  require 'spec_helper'

  describe Page do
    before(:each) do
      @valid_attributes = {
        :parent_id => nil,
        :title => "value for title",
        :page_label => "value for page label",
        :link_label => "value for link label",
        :template => "value for template",
        :keywords => "value for keywords",
        :description => "value for description",
        :slug => "value for slug",
        :is_default => false
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

      it 'should have one Parent' do
        Page.reflect_on_association(:parent).should_not be_nil
        Page.reflect_on_association(:parent).macro.should eql(:belongs_to)
      end
    end
  end
end