require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_contents/edit.html.erb" do
  include TandemContentsHelper

  before(:each) do
    assigns[:tandem_content] = @tandem_content = stub_model(TandemContent,
      :new_record? => false,
      :tandem_page_id => 1,
      :resource => stub_model(TandemText),
      :token => "value for token"
    )
    
    assigns[:tandem_page] = @tandem_page = stub_model(TandemPage)
  end

  it "renders the edit tandem_content form" do
    render

    response.should have_tag("form[action=#{tandem_page_tandem_content_path(@tandem_page, @tandem_content)}][method=post]") do
      with_tag('input#tandem_content_token[name=?]', "tandem_content[token]")
    end
  end
end
