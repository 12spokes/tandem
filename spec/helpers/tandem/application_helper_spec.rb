module Tandem
  require 'spec_helper'

  describe ApplicationHelper do
    describe "render_eco_template" do
      context 'for current_image' do
        subject { helper.render_eco_template('current_image', { id: 3 }) }

        it { should =~ /Current Image/ }
        it { should =~ /value=\"3\"/ }

        it "should not not call Eco.render multiple times" do
          Eco.should_receive(:context_for).once { mock(:compiled_template, :call => 'Seymour Butz') }
          helper.render_eco_template('current_image')
          helper.render_eco_template('current_image')
        end
      end
    end
  end
end
