module Tandem
  require 'spec_helper'

  describe "tandem/images/new.html.slim" do
    before(:each) do
      assign(:image, stub_model(Image).as_new_record)
    end

    it "renders new image form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => images_path, :method => "post" do
      end
    end
  end
end