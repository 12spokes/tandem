module Tandem
  require 'spec_helper'

  describe "tandem/pages/show.html.slim" do
    before(:each) do
      @page = assign(:page, Factory.build(:tandem_page))
    end

    it "renders home page unless persisted" do
      controller.should_receive(:can?).with(:create,@page).once.and_return(true)
      controller.should_not_receive(:can?).with(:update,@page).and_return(true)
      controller.should_not_receive(:can?).with(:destroy,@page).and_return(true)
      controller.should_receive(:can?).with(:index,Page).once.and_return(true)

      render

      assert_select "a", :text => "New Page".to_s, :count => 1
      assert_select "a", :text => "Edit Page".to_s, :count => 0
      assert_select "a", :text => "Destroy Page".to_s, :count => 0
      assert_select "a", :text => "Page Listing".to_s, :count => 1

      rendered.should match(/This is the default page/)
    end
  end

  describe "tandem/pages/show.html.slim" do
    before(:each) do
      @page = assign(:page, Factory(:tandem_page))
    end

    it_behaves_like "tandem/pages/view"

    it "renders page if persisted" do
      controller.should_receive(:can?).with(:create,@page).once.and_return(true)
      controller.should_receive(:can?).with(:update,@page).once.and_return(true)
      controller.should_receive(:can?).with(:destroy,@page).once.and_return(true)
      controller.should_receive(:can?).with(:index,Page).once.and_return(true)

      render

      assert_select "a", :text => "New Page".to_s, :count => 1
      assert_select "a", :text => "Edit Page".to_s, :count => 1
      assert_select "a", :text => "Destroy Page".to_s, :count => 1
      assert_select "a", :text => "Page Listing".to_s, :count => 1

      rendered.should_not match(/This is the default page/)
    end
  end
end