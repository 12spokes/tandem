module Tandem

  require 'spec_helper'

  describe Ability do
    before(:each) do
      @valid_attributes = User.new
    end

    let(:ability) { Ability.new(@valid_attributes) }

    it "should build a new instance given valid attributes" do
      ability.should_not be_nil
    end

    it "should have cancan methods defined" do
      ability.should respond_to(:can)
      ability.should respond_to(:cannot)
      ability.should respond_to(:can?)
      ability.should respond_to(:cannot?)
    end
  end
end