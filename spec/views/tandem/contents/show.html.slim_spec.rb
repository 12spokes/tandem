module Tandem
  require 'spec_helper'

  describe "tandem/contents/show.html.slim" do
    before(:each) do
      @content = assign(:content, stub_model(Content,
        :page_id => 1,
        :type => "Type",
        :token => "Token",
        :tag => "Tag",
        :content => "MyText",
        :bcontent => ""
      ))
    end

    it "renders attributes in <p>" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/1/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Type/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Token/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Tag/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/MyText/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(//)
    end
  end
end