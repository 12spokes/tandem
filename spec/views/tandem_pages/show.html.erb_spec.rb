require 'spec_helper'

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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ token/)
    response.should have_text(/value\ for\ layout/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ keywords/)
    response.should have_text(/value\ for\ description/)
  end
end
