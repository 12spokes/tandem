module Tandem
  require 'spec_helper'

  describe "tandem/pages/index.html.slim" do
    before(:each) do
      assign(:pages, [Factory(:tandem_page),Factory(:tandem_page)])
    end

    it "renders a list of pages" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>th", :text => "Parent".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>th", :text => "Link Label".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>th", :text => "Page Label".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>th", :text => "Page Title".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>th", :text => "Template".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>th", :text => "Keywords".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>th", :text => "Description".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "Show".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "Edit".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "Destroy".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "New Page".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr", :count => 3
    end
  end
end