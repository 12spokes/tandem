require File.dirname(__FILE__) + '/../spec_helper'

describe TandemContentsHelper do

  describe 'display_tandem_content' do
    before do
      tandem_page = stub_model(TandemPage)
      tandem_text = stub_model(TandemText, :content => 'hello cow.')
      @tandem_content = stub_model(TandemContent, :tandem_page => tandem_page, :resource_type => 'TandemText', :resource => tandem_text)
    end
    
    describe 'someone who can edit tandem content' do
      it_should_behave_like "someone who can edit tandem content"
      
      it 'should include edit and delete links' do
        content = helper.display_tandem_content(@tandem_content)
        content.should have_tag('.tandem_manage_links') do
          with_tag('a', 'Edit')
          with_tag('a', 'Delete')
        end
      end
      
      describe 'when passed a TandemText object' do
        it 'should call display_tandem_text' do
          helper.should_receive(:display_tandem_text).and_return('content')
          helper.display_tandem_content(@tandem_content)
        end

        it 'should show the text content' do
          helper.display_tandem_content(@tandem_content).should have_text /hello cow\./
        end
      end
    end

    describe 'someone who cannot edit tandem content' do
      it_should_behave_like "someone who cannot edit tandem content"
      
      it 'should now show the edit and delete links' do
        helper.display_tandem_content(@tandem_content).should_not have_tag('.tandem_manage_links')
      end
      
      it 'should show the text content' do
        helper.display_tandem_content(@tandem_content).should have_text /hello cow\./
      end
    end
  end
end
