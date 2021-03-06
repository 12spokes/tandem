module Tandem
  require 'spec_helper'

  describe PagesHelper do
    Tandem::Content.subclasses.each do |klass|
      describe "tandem_#{klass.simple_type}_tag" do
        it "aliases tandem_content_tag(:#{klass.simple_type}, ...)" do
          helper.should_receive(:tandem_content_tag).with(:identifier, klass.simple_type, { value_attr: 'value' }, { html_attr: 'html value' }) { '' }
          helper.send("tandem_#{klass.simple_type}_tag".to_sym, :identifier, { value_attr: 'value' }, { html_attr: 'html value' })
        end
      end
    end

    describe "tandem_content_tag" do 
      before(:each) do
        helper.stub(:current_user) { FactoryGirl.stub(:user) }
      end

      context "rendering text content" do
        let(:content) { FactoryGirl.create(:tandem_content_text) }

        before(:each) do
          helper.stub(:request_key) { content.request_key }
        end

        subject { helper.tandem_content_tag(content.tag, :text) }

        context "for a user who can't edit content" do
          before(:each) do
            helper.stub(:can?) { false }
          end

          it { should =~ /id="#{content.tag}"/ }
          it { should =~ /id="#{dom_class(content)}_#{content.tag}"/ }
          it { should_not =~ /class="tandem_content"/ }

          it "should not render content specific to the image sub type" do
            helper.should_not_receive(:image_content_tag)
            helper.tandem_content_tag(content.tag, :text)
          end

          it "should not include a toolbar" do
            subject.should_not have_selector('div.tandem_toolbar')
          end

          context "without a link" do
            let(:content) { FactoryGirl.create(:tandem_content_text, link_url: nil) }
            subject { helper.tandem_content_tag(content.tag, :text) }

            it { should_not =~ /id="tandem_content_link_#{content.tag}"/ }
          end
          
          context "with a link" do
            let(:content) { FactoryGirl.create(:tandem_content_text, link_url: 'http://www.12spokes.com') }
            subject { helper.tandem_content_tag(content.tag, :text) }

            it { should =~ /id="tandem_content_link_#{content.tag}"/ }
          end
        end

        context "for a user who can edit content" do
          before(:each) do
            helper.stub(:can?) { true }
          end

          it { should =~ /class="tandem_content"/ }

          it "should include a toolbar" do
            helper.should_receive(:can?).with(:update, content) { true }
            subject.should have_selector("#tandem_toolbar_#{content.tag}")
            subject.should have_selector('div.tandem_toolbar')
          end

          it "should pass the default editor type to the content form through the edit link" do
              subject.should have_selector("a[href='#{edit_content_path(content.id, editor: :plain)}']")
            end

          context "setting the editor to :wysiwyg" do
            subject { helper.tandem_content_tag(content.tag, :text, editor: :wysiwyg) }

            it "should pass the editor type to the content form through the edit link" do
              subject.should have_selector("a[href='#{edit_content_path(content.id, editor: :wysiwyg)}']")
            end
          end

          context "setting the editor to :plain" do
            subject { helper.tandem_content_tag(content.tag, :text, editor: :plain) }

            it "should pass the editor type to the content form through the edit link" do
              subject.should have_selector("a[href='#{edit_content_path(content.id, editor: :plain)}']")
            end
          end
        end
      end


      context "rendering image content" do
        let(:content) { FactoryGirl.create(:tandem_content_image) }

        context "for a user who can't edit content" do
          before(:each) do
            helper.stub(:can?) { false }
          end

          it "should render content specific to the image sub type" do
            helper.should_receive(:image_content_tag).once.and_return('')
            helper.tandem_content_tag(content.tag, :image)
          end
        end
      end
    end

    describe "tandem_navigation_tag" do
      it "should select the selected page" do
        @pages = [FactoryGirl.create(:tandem_page),FactoryGirl.create(:tandem_page)]
        @page = @pages.first
        result = helper.tandem_navigation_tag(@page)

        result =~ /<li ([^>]*)id="tandem_page_#{@page.id}"([^>]*)>/
        ($1 + $2).should =~ /class="tandem_page active"/

        result =~ /<li ([^>]*)id="tandem_page_#{@pages.last.id}"([^>]*)>/
        ($1 + $2).should =~ /class="tandem_page"/
      end

      context "being called without a passed in collection" do
        let(:top_level_page) { FactoryGirl.create(:tandem_page) }
        let(:child_1) { FactoryGirl.create(:tandem_page, :parent => top_level_page) }
        let(:top_level_page2) { FactoryGirl.create(:tandem_page) }

        subject { helper.tandem_navigation_tag(top_level_page) }

        it { should match( page_path(top_level_page) ) }
        it { should match( page_path(child_1) ) }
        it { should match( page_path(top_level_page2) ) }
      end

      context "being called with a passed in collection" do
        let(:page) { FactoryGirl.create(:tandem_page) }
        let(:child_1) { FactoryGirl.create(:tandem_page, :parent => page) }

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
            assign(:page, FactoryGirl.build(:tandem_page))
          end

          subject { helper.tandem_page_links }

          it { should match(/New Page/) }
          it { should_not match(/Edit Page/) }
          it { should_not match(/Destroy Page/) }
          it { should match(/Page Listing/) }
        end

        context 'for a persisted page' do
          before(:each) do
            assign(:page, FactoryGirl.create(:tandem_page))
          end

          subject { helper.tandem_page_links }

          it { should match(/New Page/) }
          it { should match(/Edit Page/) }
          it { should match(/Destroy Page/) }
          it { should match(/Page Listing/) }
        end

        context 'on a non-tandem page' do
          subject { helper.tandem_page_links }

          it { should match(/New Page/) }
          it { should_not match(/Edit Page/) }
          it { should_not match(/Destroy Page/) }
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

      it 'doesnt include things that dont match the regex' do
        helper.valid_layouts.should_not include('_logo.svg')
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

    describe '#request_key' do
      context "from tandem/pages#home" do
        before(:each) do
          helper.stub(:controller_path) { 'tandem/pages' }
          helper.stub(:action_name) { 'home' }
        end

        subject { helper.send(:request_key) }

        it { should == 'tandem-pages-home' }
      end

      context "from tandem/pages#show" do
        before(:each) do
          helper.stub(:controller_path) { 'tandem/pages' }
          helper.stub(:action_name) { 'show' }
          helper.stub(:params) { { id: 'bamboo' } }
        end

        subject { helper.send(:request_key) }

        it { should == 'tandem-pages-show-bamboo' }
      end
    end
  end
end
