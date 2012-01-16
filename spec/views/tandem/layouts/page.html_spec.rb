module Tandem
  require 'spec_helper'

  describe "../../lib/generators/templates/layouts/tandem/page.html.erb" do
    include SharedSpecHelpers
    before(:each) do
      @page = assign(:page, Factory.build(:tandem_page))
      stub_all_view_helpers
    end

    it "renders layout" do
      render

      assert_select "title", {:count => 1, :text => @page.title}
      assert_select "meta" do
        assert_select "[name=description][content='#{@page.description}']", 1
        assert_select "[name=keywords][content='#{@page.keywords}']", 1
      end
    end
  end
end