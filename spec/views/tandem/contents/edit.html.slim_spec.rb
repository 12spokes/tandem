module Tandem
  require 'spec_helper'

  describe "contents/edit.html.slim" do
    before(:each) do
      @content = assign(:content, stub_model(Content,
        :page_id => 1,
        :type => "",
        :token => "MyString",
        :tag => "MyString",
        :content => "MyText",
        :bcontent => ""
      ))
    end

    it "renders the edit content form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => contents_path(@content), :method => "post" do
        assert_select "input#content_page_id", :name => "content[page_id]"
        assert_select "input#content_type", :name => "content[type]"
        assert_select "input#content_token", :name => "content[token]"
        assert_select "input#content_tag", :name => "content[tag]"
        assert_select "textarea#content_content", :name => "content[content]"
        assert_select "input#content_bcontent", :name => "content[bcontent]"
      end
    end
  end
end