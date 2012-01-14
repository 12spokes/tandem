module Tandem
  require 'spec_helper'

  describe "tandem/pages/show.html.slim" do
    before(:each) do
      @page = assign(:page, Factory(:tandem_page))
      @ability = Ability.new(User.new)
      controller.stub(:current_ability) { @ability }
    end

    it "renders page" do
      render

      #todo, test ability dependent behavior

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "New Page".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "Edit Page".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "Destroy Page".to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "a", :text => "Page Listing".to_s, :count => 1

      #todo: move the following into a test that inspects the layout
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      #assert_select "meta", :name => "description", :content => @page.description.to_s, :count => 1
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      #assert_select "meta", :name => "keywords", :content => @page.keywords.to_s, :count => 1

    end
  end
end