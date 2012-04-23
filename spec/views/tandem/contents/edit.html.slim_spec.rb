module Tandem
  require 'spec_helper'

  describe "tandem/contents/edit" do
    include SharedSpecHelpers

    before(:each) do
      stub_all_view_helpers
    end

    describe "Sub Type - Tandem::Content::Text" do
      before(:each) do
        @content = assign(:content, Factory(:tandem_content_text))
      end

      it "renders the edit content text form" do
        render

        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form", :action => content_path(@content.id), :method => "post" do
          assert_select "textarea#content_text_content", :name => "content[content]"
          assert_select "input#content_text_link_url", :name => "content[link_url]"
          assert_select "input#content_text_link_target", :name => "content[link_target]"
        end
      end
    end

    describe "Sub Type - Tandem::Content::Image" do
      before(:each) do
        @content = assign(:content, Factory(:tandem_content_image))
      end

      it "renders the edit content image form" do
        render

        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form", :action => content_path(@content.id), :method => "post" do
          assert_select "input#content_image_link_url", :name => "content[link_url]"
          assert_select "input#content_image_link_target", :name => "content[link_target]"
        end
      end
    end
  end
end
