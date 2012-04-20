module Tandem
  require 'spec_helper'

  describe "tandem/images/index" do
    before(:each) do
      assign(:images, [
        stub_model(Image),
        stub_model(Image)
      ])
    end

    it "renders a list of images" do
      render
    end
  end
end
