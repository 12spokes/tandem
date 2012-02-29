module Tandem

  require 'spec_helper'

  describe Content::Image do
    it "should create a new instance given valid attributes" do
      Content::Image.create!(Factory.attributes_for(:tandem_content_image))
    end
  end
end
