require 'spec_helper'

describe "/tandem_pages/new.html.erb" do
  include TandemPagesHelper

  before(:each) do
    assigns[:tandem_page] = stub_model(TandemPage,
      :new_record? => true,
      :title => "value for title",
      :token => "value for token",
      :layout => "value for layout",
      :parent_id => 1,
      :keywords => "value for keywords",
      :description => "value for description"
    )
  end

  it "renders new tandem_page form" do
    render

    response.should have_tag("form[action=?][method=post]", tandem_pages_path) do
      with_tag("input#tandem_page_title[name=?]", "tandem_page[title]")
      with_tag("input#tandem_page_token[name=?]", "tandem_page[token]")
      with_tag("input#tandem_page_layout[name=?]", "tandem_page[layout]")
      with_tag("input#tandem_page_parent_id[name=?]", "tandem_page[parent_id]")
      with_tag("input#tandem_page_keywords[name=?]", "tandem_page[keywords]")
      with_tag("input#tandem_page_description[name=?]", "tandem_page[description]")
    end
  end
end
