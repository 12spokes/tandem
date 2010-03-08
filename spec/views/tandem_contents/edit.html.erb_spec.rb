require 'spec_helper'

describe "/tandem_contents/edit.html.erb" do
  include TandemContentsHelper

  before(:each) do
    assigns[:tandem_content] = @tandem_content = stub_model(TandemContent,
      :new_record? => false,
      :tandem_page_id => 1,
      :resource_type => "value for resource_type",
      :resource_id => 1,
      :token => "value for token"
    )
  end

  it "renders the edit tandem_content form" do
    render

    response.should have_tag("form[action=#{tandem_content_path(@tandem_content)}][method=post]") do
      with_tag('input#tandem_content_tandem_page_id[name=?]', "tandem_content[tandem_page_id]")
      with_tag('input#tandem_content_resource_type[name=?]', "tandem_content[resource_type]")
      with_tag('input#tandem_content_resource_id[name=?]', "tandem_content[resource_id]")
      with_tag('input#tandem_content_token[name=?]', "tandem_content[token]")
    end
  end
end
