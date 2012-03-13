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

    describe 'proxied url helpers' do
      context 'calling a main app url helper with 0 arguments' do
        subject { helper.new_widget_path }
        it { should == '/widgets/new' }
      end

      context 'calling a main app url helper with arguments' do
        subject { helper.widget_path(mock_model(Widget, id: 123)) }
        it { should == '/widgets/123' }
      end
    end

  end
end
