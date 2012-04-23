module Tandem
  require 'spec_helper'

  describe "tandem/pages/edit" do
    before(:each) do
      @page = assign(:page, Factory(:tandem_page))
    end

    it "renders the edit page form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => page_path(@page), :method => "post" do
        assert_select "input#page_parent_id_", :name => "page[parent_id]"
        assert_select "input#page_title", :name => "page[title]"
        assert_select "input#page_page_label", :name => "page[page_label]"
        assert_select "input#page_link_label", :name => "page[link_label]"
        assert_select "select#page_layout", :name => "page[layout]"
        assert_select "select#page_template", :name => "page[template]"
        assert_select "input#page_keywords", :name => "page[keywords]"
        assert_select "input#page_description", :name => "page[description]"
        assert_select "input#page_slug", :name => "page[slug]"
        assert_select "input#page_is_default", :name => "page[is_default]"
      end
    end
  end
end
