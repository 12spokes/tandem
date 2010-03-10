require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_pages/edit.html.erb" do
  include TandemPagesHelper

  before(:each) do
    assigns[:tandem_page] = @tandem_page = stub_model(TandemPage,
      :new_record? => false,
      :title => "value for title",
      :token => "value for token",
      :layout => "value for layout",
      :parent_id => 1,
      :keywords => "value for keywords",
      :description => "value for description"
    )
  end

  it "renders the edit tandem_page form" do
    render

    response.should have_tag("form[action=#{tandem_page_path(@tandem_page)}][method=post]") do
      with_tag('input#tandem_page_title[name=?]', "tandem_page[title]")
      with_tag('input#tandem_page_token[name=?]', "tandem_page[token]")
      with_tag('input#tandem_page_layout[name=?]', "tandem_page[layout]")
      with_tag('input#tandem_page_parent_id[name=?]', "tandem_page[parent_id]")
      with_tag('input#tandem_page_keywords[name=?]', "tandem_page[keywords]")
      with_tag('input#tandem_page_description[name=?]', "tandem_page[description]")
    end
  end
end
