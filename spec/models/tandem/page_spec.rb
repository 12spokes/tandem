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

    describe 'top_level' do
      subject { Page.top_level }

      before(:each) do
        @top_page = Factory(:tandem_page)
        @child_page = Factory(:tandem_page, :parent => @top_page)
      end

      it { should include(@top_page) }
      it { should_not include(@child_page) }
    end

    describe 'children' do
      subject { @top_page }

      before(:each) do
        @top_page = Factory(:tandem_page)
        @child_page = Factory(:tandem_page, :parent => @top_page)
        @other_page = Factory(:tandem_page)
      end

      its(:children) { should include(@child_page) }
      its(:children) { should_not include(@other_page) }
    end
  end
end
