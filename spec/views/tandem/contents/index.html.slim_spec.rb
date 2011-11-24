module Tandem
  require 'spec_helper'

  describe "tandem/contents/index.html.slim" do
    before(:each) do
      assign(:contents, [
        stub_model(Content,
          :page_id => 1,
          :type => "Type",
          :token => "Token",
          :tag => "Tag",
          :content => "MyText",
          :bcontent => ""
        ),
        stub_model(Content,
          :page_id => 1,
          :type => "Type",
          :token => "Token",
          :tag => "Tag",
          :content => "MyText",
          :bcontent => ""
        )
      ])
    end

    it "renders a list of contents" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => 1.to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Type".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Token".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "Tag".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "MyText".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "tr>td", :text => "".to_s, :count => 2
    end
  end
end