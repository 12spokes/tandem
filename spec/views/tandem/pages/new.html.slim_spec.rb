module Tandem
  require 'spec_helper'

  describe "pages/new.html.slim" do
    before(:each) do
      assign(:page, stub_model(Page,
        :parent_id => 1,
        :title => "MyString",
        :token => "MyString",
        :layout => "MyString",
        :template => "MyString",
        :keywords => "MyString",
        :description => "MyString"
      ).as_new_record)
    end

    it "renders new page form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => pages_path, :method => "post" do
        assert_select "input#page_parent_id", :name => "page[parent_id]"
        assert_select "input#page_title", :name => "page[title]"
        assert_select "input#page_token", :name => "page[token]"
        assert_select "input#page_layout", :name => "page[layout]"
        assert_select "input#page_template", :name => "page[template]"
        assert_select "input#page_keywords", :name => "page[keywords]"
        assert_select "input#page_description", :name => "page[description]"
      end
    end
  end
end