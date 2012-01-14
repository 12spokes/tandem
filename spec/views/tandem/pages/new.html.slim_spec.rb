module Tandem
  require 'spec_helper'

  describe "tandem/pages/new.html.slim" do
    before(:each) do
      assign(:page, Factory.build(:tandem_page))
    end

    it "renders new page form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => pages_path, :method => "post" do
        assert_select "input#page_parent_id", :name => "page[parent_id]"
        assert_select "input#page_title", :name => "page[title]"
        assert_select "input#page_page_label", :name => "page[page_label]"
        assert_select "input#page_link_label", :name => "page[link_label]"
        assert_select "select#page_template", :name => "page[template]"
        assert_select "input#page_keywords", :name => "page[keywords]"
        assert_select "input#page_description", :name => "page[description]"
        assert_select "input#page_slug", :name => "page[slug]"
        assert_select "input#page_is_default", :name => "page[is_default]"
      end
    end
  end
end