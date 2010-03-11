require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_pages/index.html.erb" do
  include TandemPagesHelper

  before(:each) do
    assigns[:tandem_pages] = [
      stub_model(TandemPage,
        :title => "value for title",
        :token => "value for token",
        :layout => "value for layout",
        :parent_id => 1,
        :keywords => "value for keywords",
        :description => "value for description"
      ),
      stub_model(TandemPage,
        :title => "value for title",
        :token => "value for token",
        :layout => "value for layout",
        :parent_id => 1,
        :keywords => "value for keywords",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of tandem_pages" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for token".to_s, 2)
    response.should have_tag("tr>td", "value for layout".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
