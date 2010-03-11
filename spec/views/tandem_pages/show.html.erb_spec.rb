require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_pages/show.html.erb" do
  include TandemPagesHelper
  before(:each) do
    assigns[:tandem_page] = @tandem_page = stub_model(TandemPage,
      :title => "value for title",
      :token => "value for token",
      :layout => "value for layout",
      :parent_id => 1,
      :keywords => "value for keywords",
      :description => "value for description"
    )
    
    @tandem_text1 = stub_model(TandemText, :content => 'Gurgles.')
    @tandem_text2 = stub_model(TandemText, :content => 'Giggles.')
    
    @tandem_page.stub!(:tandem_contents).and_return([stub_model(TandemContent, :tandem_page => @tandem_page, :resource_type => 'TandemText', :resource => @tandem_text1), 
                                                      stub_model(TandemContent, :tandem_page => @tandem_page, :resource_type => 'TandemText', :resource => @tandem_text2)])
  end

  describe 'someone who cannot edit tandem content' do
    it_should_behave_like "someone who cannot edit tandem content"
    
    it "renders every tandem_content" do
      render
      response.should have_tag('div.tandem_content', 2)
    end
    
    it 'should not show a link to add content' do
      render
      response.should_not have_tag('a', 'Add content')
    end
  end
  
  describe 'someone who can edit tandem content' do
    it_should_behave_like "someone who can edit tandem content"
    
    it 'should show a link to add content' do
      render
      response.should have_tag('a', 'Add content')
    end
  end
end
