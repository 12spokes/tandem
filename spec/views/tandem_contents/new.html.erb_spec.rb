require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_contents/new.html.erb" do
  include TandemContentsHelper

  before(:each) do
    assigns[:tandem_content] = stub_model(TandemContent,
      :new_record? => true,
      :tandem_page_id => 1,
      :token => "value for token"
    )
    
    assigns[:tandem_page] = @tandem_page = stub_model(TandemPage)
  end

  it "renders new tandem_content form" do
    render

    response.should have_tag("form[action=?][method=post]", tandem_page_tandem_contents_path(@tandem_page)) do
      with_tag("input#tandem_content_token[name=?]", "tandem_content[token]")
    end
  end
end