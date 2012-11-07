module Tandem

  require 'spec_helper'

  describe Content::Text do
    it "should create a new instance given valid attributes" do
      Content::Text.create!(FactoryGirl.attributes_for(:tandem_content_text))
    end

  end
end
