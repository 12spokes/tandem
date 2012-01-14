module Tandem

  require 'spec_helper'

  describe Image do
    before(:each) do
      @valid_attributes = {
          :resource => File.new(ENGINE_RAILS_ROOT + 'spec/fixtures/tandem/images/test.jpg')
      }
    end

    it "should create a new instance given valid attributes" do
      Image.create!(@valid_attributes)
    end

    describe 'associations' do
      it 'should have many TandemContentImages' do
        Image.reflect_on_association(:content_images).should_not be_nil
        Image.reflect_on_association(:content_images).macro.should eql(:has_many)
      end
    end
  end
end