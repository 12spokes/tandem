begin
  require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
rescue LoadError
  puts "You need to install rspec in your base app"
  exit
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

describe "someone who can edit tandem content", :shared => true do
  before do
    if defined?(template)
      template.stub!(:can_edit_tandem_content?).and_return(true)
      template.controller.stub!(:can_edit_tandem_content?).and_return(true)
    elsif defined?(helper)
      helper.stub!(:can_edit_tandem_content?).and_return(true)
    elsif defined?(controller)
      controller.stub!(:can_edit_tandem_content?).and_return(true)
    end
  end
end

describe "someone who cannot edit tandem content", :shared => true do
  before do
    if defined?(template)
      template.stub!(:can_edit_tandem_content?).and_return(false)
      template.controller.stub!(:can_edit_tandem_content?).and_return(false)
    elsif defined?(helper)
      helper.stub!(:can_edit_tandem_content?).and_return(false)
    elsif defined?(controller)
      controller.stub!(:can_edit_tandem_content?).and_return(false)
    end
  end
end

def bar_actions(*actions)
  actions.each do |method, action, options|
    describe "#{method.to_s.upcase} #{action}" do
      it 'should redirect to root path' do
        send(method, action, options.is_a?(String) ? eval(options) : options)
        response.should redirect_to(root_path)
      end
    end
  end
end