module Tandem
  require 'spec_helper'

  describe ApplicationHelper do
    describe "render_eco_template" do
      context 'for current_image' do
        subject { helper.render_eco_template('current_image', { id: 3 }) }

        it { should =~ /Current Image/ }
        it { should =~ /value=\"3\"/ }
      end
    end
  end
end
