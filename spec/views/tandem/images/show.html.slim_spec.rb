module Tandem
  require 'spec_helper'

  describe "tandem/images/show.html.slim" do
    before(:each) do
      @image = assign(:image, stub_model(Image))
    end

    it "renders attributes in <p>" do
      render
    end
  end
end