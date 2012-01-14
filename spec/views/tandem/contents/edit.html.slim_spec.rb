module Tandem
  require 'spec_helper'

  #todo: upgrade this spec to test both kinds of content

  describe "tandem/contents/edit.html.slim" do
    before(:each) do
      @page = assign(:page, Factory(:tandem_page))
      @content = assign(:content, stub_model(Content::Text,
        :page => @page,
        :tag => 'value for tag',
        :content => 'value for content',
        :link_url => 'value for link url',
        :link_target => '_blank'
      ))
    end

    it "renders the edit content form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => page_content_path(@page.id,@content.id), :method => "post" do
        assert_select "textarea#content_text_content", :name => "content[content]"
        assert_select "input#content_text_link_url", :name => "content[link_url]"
        assert_select "input#content_text_link_target", :name => "content[link_target]"
      end
    end
  end
end