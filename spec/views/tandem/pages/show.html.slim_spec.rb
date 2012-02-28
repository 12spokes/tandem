module Tandem
  require 'spec_helper'

  describe "tandem/pages/show.html.slim" do
    before(:each) do
      controller.stub(:can?).and_return(true)
      controller.stub(:cannot?).and_return(false)
      view.stub(:tandem_text_tag).and_return(nil)
      view.stub(:tandem_image_tag).and_return(nil)
    end

    context 'new page' do
      before(:each) do
        @page = assign(:page, Factory.build(:tandem_page))
      end

      it "renders home page unless persisted" do
        render
        rendered.should match(/This is the default page/)
      end
    end

    context 'persisted page' do
      before(:each) do
        @page = assign(:page, Factory(:tandem_page))
      end

      it_behaves_like "tandem/pages/view"

      it "renders page if persisted" do
        render
        rendered.should_not match(/This is the default page/)
      end
    end
  end
end
