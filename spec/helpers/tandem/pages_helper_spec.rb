module Tandem
  require 'spec_helper'

  describe PagesHelper do
    Tandem::Content.subclasses.each do |klass|
      describe "tandem_#{klass.simple_type}_tag" do

        before(:each) do
          @page = Factory(:tandem_page)
          helper.stub(:image_content_tag) {''}
          helper.stub(:can?) {false}
        end

        it "aliases tandem_content_tag(page, :#{klass.simple_type}, ..." do
          helper.send("tandem_#{klass.simple_type}_tag".to_sym, @page, 'identifier', { value_attr: 'value' }, { html_attr: 'html value' }).should ==
              helper.tandem_content_tag(@page, 'identifier', klass.simple_type, { value_attr: 'value' }, { html_attr: 'html value' })
        end
      end
    end

    describe "tandem_content_tag" do
      it "should render a unique html element containing sub-content" do
        helper.stub(:can?) {false}
        @content = Factory(:tandem_content_text)
        result = helper.tandem_content_tag(@content.page,@content.tag,:text)
        result.should =~ /id="#{@content.tag}"/
        result.should =~ /id="#{dom_class(@content)}_#{@content.tag}"/
      end

      it "should render content specific to the text sub type" do
        helper.stub(:can?) {false}
        @content = Factory(:tandem_content_text)
        helper.should_receive(:image_content_tag).at_most(0)
        helper.tandem_content_tag(@content.page,@content.tag,:text)
      end

      it "should render content specific to the image sub type" do
        helper.stub(:can?) {false}
        @content = Factory(:tandem_content_image)
        helper.should_receive(:image_content_tag).once.and_return('')
        helper.tandem_content_tag(@content.page,@content.tag,:image)
      end

      it "should include a link if present" do
        helper.stub(:can?) {false}
        @content = Factory(:tandem_content_text)
        helper.tandem_content_tag(@content.page,@content.tag,:text).should =~ /id="tandem_content_link_#{@content.tag}"/
        @content.class.any_instance.stub(:link?) {false}
        helper.tandem_content_tag(@content.page,@content.tag,:text).should_not =~ /id="tandem_content_link_#{@content.tag}"/
      end

      it "should include a toolbar if authorized" do
        @content = Factory(:tandem_content_text)
        helper.should_receive(:can?).once.with(:update, @content) {true}
        helper.tandem_content_tag(@content.page,@content.tag,:text).should =~ /id="tandem_toolbar_#{@content.tag}"/
        helper.should_receive(:can?).once.with(:update, @content) {false}
        helper.tandem_content_tag(@content.page,@content.tag,:text).should_not =~ /id="tandem_toolbar_#{@content.tag}"/
      end

    end

    describe "tandem_navigation_tag" do
      it "should select the selected page" do
        @pages = [Factory(:tandem_page),Factory(:tandem_page)]
        @page = @pages.first
        result = helper.tandem_navigation_tag(@page)

        result =~ /<li ([^>]*)id="link_tandem_page_#{@page.id}"([^>]*)>/
        ($1 + $2).should =~ /class="link_tandem_page active"/

        result =~ /<li ([^>]*)id="link_tandem_page_#{@pages.last.id}"([^>]*)>/
        ($1 + $2).should =~ /class="link_tandem_page"/
      end
    end

    describe "valid_layouts" do
      it "should not include layouts defined in the tandem namespace" do
        helper.valid_layouts.should_not include('tandem/image')
      end

      it "should include layouts in host app" do
        helper.valid_layouts.should include('application')
      end
    end
  end
end
