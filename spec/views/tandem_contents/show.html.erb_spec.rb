require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_contents/show.html.erb" do
  include TandemContentsHelper
  before(:each) do
    assigns[:tandem_content] = @tandem_content = stub_model(TandemContent,
      :tandem_page_id => 1,
      :resource_type => "value for resource_type",
      :resource_id => 1,
      :token => "value for token"
    )
    
    assigns[:tandem_page] = @tandem_page = stub_model(TandemPage)
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ resource_type/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ token/)
  end
end
