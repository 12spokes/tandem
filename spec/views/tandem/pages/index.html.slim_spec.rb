module Tandem
  require 'spec_helper'

  describe "pages/index.html.slim" do
    before(:each) do
      assign(:pages, [
        stub_model(Page,
          :parent_id => 1,
          :title => "Title",
          :token => "Token",
          :layout => "Layout",
          :template => "Template",
          :keywords => "Keywords",
          :description => "Description"
        ),
        stub_model(Page,
          :parent_id => 1,
          :title => "Title",
          :token => "Token",
          :layout => "Layout",
          :template => "Template",
          :keywords => "Keywords",
          :description => "Description"
        )
      ])
    end

    it "renders a list of pages" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => 1.to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Title".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Token".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Layout".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Template".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Keywords".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Description".to_s, :count => 2
    end
  end
end