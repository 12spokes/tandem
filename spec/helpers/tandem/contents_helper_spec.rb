module Tandem
  require 'spec_helper'

  describe ContentsHelper do
    describe "image_content_url" do
      it "accepts a Tandem::Content::Image and returns a relative url to a sample image with no associated Tandem::Image" do
        content = Tandem::Content::Image.new
        helper.image_content_url(content).should == 'tandem/blank_image.jpg'
      end

      it "accepts a Tandem::Content::Image and returns a relative url an associated Tandem::Image" do
        content = FactoryGirl.build(:tandem_content_image)
        helper.image_content_url(content).should == content.image.resource.url
      end

      it "accepts a Tandem::Content::Image and format and returns a relative url an associated Tandem::Image" do
        content = FactoryGirl.build(:tandem_content_image)
        helper.image_content_url(content, :thumb).should == content.image.resource.url(:thumb)
      end
    end

    describe "image_content_tag" do

      it "accepts a Tandem::Content::Image and html options and returns an image_tag" do
        content = Tandem::Content::Image.new
        helper.image_content_tag(content, :attr => 'this value').should == "<img alt=\"Blank_image\" attr=\"this value\" src=\"/assets/tandem/blank_image.jpg\" />"
      end

      it "accepts a Tandem::Content::Image (with associatated Tandem::Image) and html options and returns an image_tag" do
        content = FactoryGirl.build(:tandem_content_image)
        result = helper.image_content_tag(content, :attr => 'this value')
        result.should =~ /^<img/
        result.should =~ /attr="this value"/
        result =~ /src="(.*)"/
        $1.should == helper.image_content_url(content)
      end

      it "accepts a Tandem::Content::Image and format and returns an image_tag" do
        content = FactoryGirl.build(:tandem_content_image)
        result = helper.image_content_tag(content, {}, :thumb)
        result.should =~ /^<img/
        result =~ /src="([^"]*)"/
        $1.should == helper.image_content_url(content, :thumb)
      end

    end
  end
end
