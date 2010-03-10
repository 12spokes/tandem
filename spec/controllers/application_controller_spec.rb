require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationController do
  it 'should have a can_edit_tandem_content? method' do
    controller.should respond_to(:can_edit_tandem_content?)
  end
  
  it 'should make can_edit_tandem_content? available via helper_method' do
    controller.master_helper_module.instance_methods.include?('can_edit_tandem_content?')
  end
end