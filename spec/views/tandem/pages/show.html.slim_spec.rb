module Tandem
  require 'spec_helper'

  describe "pages/show.html.slim" do
    before(:each) do
      @page = assign(:page, stub_model(Page,
        :parent_id => 1,
        :title => "Title",
        :token => "Token",
        :layout => "Layout",
        :template => "Template",
        :keywords => "Keywords",
        :description => "Description"
      ))
    end

    it "renders attributes in <p>" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/1/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Title/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Token/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Layout/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Template/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Keywords/)
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      rendered.should match(/Description/)
    end
  end
end