require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_contents/index.html.erb" do
  include TandemContentsHelper

  before(:each) do
    assigns[:tandem_contents] = [
      stub_model(TandemContent,
        :tandem_page_id => 1,
        :resource_type => "value for resource_type",
        :resource_id => 1,
        :token => "value for token"
      ),
      stub_model(TandemContent,
        :tandem_page_id => 1,
        :resource_type => "value for resource_type",
        :resource_id => 1,
        :token => "value for token"
      )
    ]
    
    assigns[:tandem_page] = @tandem_page = stub_model(TandemPage)
  end

  it "renders a list of tandem_contents" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for resource_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for token".to_s, 2)
  end
end
