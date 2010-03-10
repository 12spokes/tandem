require File.dirname(__FILE__) + '/../spec_helper'

describe TandemContentsHelper do

  describe 'display_tandem_content' do
    describe 'when passed a TandemText object' do
      before do
        tandem_text = stub_model(TandemText, :content => 'hello cow.')
        @tandem_content = stub_model(TandemContent, :resource_type => 'TandemText', :resource => tandem_text)
      end
      
      it 'should call display_tandem_text' do
        helper.should_receive(:display_tandem_text)
        helper.display_tandem_content(@tandem_content)
      end
      
      it 'should show the text content' do
        helper.display_tandem_content(@tandem_content).should == 'hello cow.'
      end
    end
  end

end
