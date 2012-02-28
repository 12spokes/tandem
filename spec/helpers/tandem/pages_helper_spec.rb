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

      context "being called without a passed in collection" do
        let(:top_level_page) { Factory(:tandem_page) }
        let(:child_1) { Factory(:tandem_page, :parent => top_level_page) }
        let(:top_level_page2) { Factory(:tandem_page) }

        subject { helper.tandem_navigation_tag(top_level_page) }

        it { should match( page_path(top_level_page) ) }
        it { should match( page_path(child_1) ) }
        it { should match( page_path(top_level_page2) ) }
      end

      context "being called with a passed in collection" do
        let(:page) { Factory(:tandem_page) }
        let(:child_1) { Factory(:tandem_page, :parent => page) }

        subject { helper.tandem_navigation_tag(page, page.children) }

        it { should_not match( page_path(page) ) }
        it { should match( page_path(child_1) ) }
      end
    end

    describe "tandem_page_links" do
      context 'with full editing abilities' do
        before(:each) do
          helper.stub(:can?).and_return(true)
          helper.stub(:cannot?).and_return(false)
        end

        context 'for a new page' do
          before(:each) do
            assign(:page, Factory.build(:tandem_page))
          end

          subject { helper.tandem_page_links }

          it { should match(/New Page/) }
          it { should_not match(/Edit Page/) }
          it { should_not match(/Destroy Page/) }
          it { should match(/Page Listing/) }
        end

        context 'for a persisted page' do
          before(:each) do
            assign(:page, Factory(:tandem_page))
          end

          subject { helper.tandem_page_links }

          it { should match(/New Page/) }
          it { should match(/Edit Page/) }
          it { should match(/Destroy Page/) }
          it { should match(/Page Listing/) }
        end
      end

      context 'for a user who cannot manage content' do
        before(:each) do
          helper.stub(:cannot?).and_return(true)
        end

        subject { helper.tandem_page_links }

        it { should be_nil }
      end
    end

    describe "valid_layouts" do
      it "should not include layouts defined in the tandem namespace" do
        helper.valid_layouts.should_not include('tandem/image')
      end

      it "should include not include the default application layout" do
        helper.valid_layouts.should_not include('application')
      end

      it "should include a custom layout defined in the host app" do
        helper.valid_layouts.should include('custom_layout')
      end

    end

    describe "valid_templates" do
      it "should include custom templates in the host app" do
        helper.valid_templates.should include('custom_template')
      end

      context "with a custom show template" do
        filename = "#{::Rails.root}/app/views/tandem/pages/show.html.slim"
        
        before(:each) do
          File.open(filename, "w") {}
        end

        after(:each) do
          File.delete(filename)
        end

        it "should not include it" do
          helper.valid_templates.should_not include('show')
        end
      end

      context "with a custom edit template" do
        filename = "#{::Rails.root}/app/views/tandem/pages/edit.html.slim"
        
        before(:each) do
          File.open(filename, "w") {}
        end

        after(:each) do
          File.delete(filename)
        end
        
        it "should not include it" do
          helper.valid_templates.should_not include('edit')
        end
      end

      it "should not include any partials" do
        helper.valid_templates.select { |template| template[0] == '_' }.should be_empty
      end
    end
  end
end
