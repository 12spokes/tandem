module Tandem
  require 'spec_helper'

  describe "tandem/pages/index.html.slim" do
    before(:each) do
      assign(:pages, [Factory(:tandem_page),Factory(:tandem_page)])
    end

    it_behaves_like "tandem/pages/view", ['Edit','Destroy']

    it "renders a list of pages" do
      controller.stub(:can?) { |action, target| true }

      render

      assert_select "tr>th", :text => "Parent".to_s, :count => 1
      assert_select "tr>th", :text => "Link Label".to_s, :count => 1
      assert_select "tr>th", :text => "Page Label".to_s, :count => 1
      assert_select "tr>th", :text => "Page Title".to_s, :count => 1
      assert_select "tr>th", :text => "Layout".to_s, :count => 1
      assert_select "tr>th", :text => "Keywords".to_s, :count => 1
      assert_select "tr>th", :text => "Description".to_s, :count => 1
      assert_select "a", :text => "Show".to_s, :count => 2
      assert_select "a", :text => "Edit".to_s, :count => 2
      assert_select "a", :text => "Delete".to_s, :count => 2
      assert_select "a", :text => "New Page".to_s, :count => 1
      assert_select "tr", :count => 3
    end
  end
end
