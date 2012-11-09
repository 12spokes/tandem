module Tandem
  require 'spec_helper'

  describe ImagesHelper do
    describe "tandem_image_tag" do

      it "accepts a Tandem::Image and html options and returns an image_tag" do
        image = FactoryGirl.build(:tandem_image)
        result = helper.tandem_image_tag(image, :attr => 'this value')
        result.should =~ /^<img/
        result.should =~ /attr="this value"/
        result =~ /src="(.*)"/
        $1.should == image.resource.url
      end

      it "accepts a Tandem::Image and format and returns an image_tag" do
        image = FactoryGirl.build(:tandem_image)
        result = helper.tandem_image_tag(image, {}, :thumb)
        result.should =~ /^<img/
        result =~ /src="([^"]*)"/
        $1.should == image.resource.url(:thumb)
      end

    end
  end
end
