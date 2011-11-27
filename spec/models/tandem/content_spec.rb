module Tandem

  require 'spec_helper'

  describe Content do
    describe 'associations' do
      it 'should belong to a tandem_page' do
        Content.reflect_on_association(:page).should_not be_nil
        Content.reflect_on_association(:page).macro.should eql(:belongs_to)
      end
    end
  end
end