module Tandem

  require 'spec_helper'

  describe Content::Text do
    before(:each) do
      @valid_attributes = {
        :page_id => 1,
        :token => "value for token"
      }
    end

    it "should create a new instance given valid attributes" do
      Content::Text.create!(@valid_attributes)
    end

  end
end