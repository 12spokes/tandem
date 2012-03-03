require 'spec_helper'

describe "Editing" do
  describe "text content" do
    it "changes the content", :js => true do
      visit root_path

      page.execute_script("$('#tandem_toolbar_tandem_text_block').show()") #simulate hover
      click_link 'tandem_edit_link_tandem_text_block'

      sleep 1 #wait for iframe to load
      iframe_name = page.evaluate_script("$('iframe.cboxIframe').attr('name');")

      within_frame iframe_name do
        page.execute_script("jQuery.wymeditors(0).html('<p>I love tandem!</p>');")
        #fill_in 'content_text_content', :with => 'I love tandem!'
        click_button 'Save Your Changes'
      end

      within '#tandem_content_text_tandem_text_block' do
        page.should have_content('I love tandem!')
      end
    end
  end
end

describe "Tandem Content on non-tandem pages" do
  describe "get /widgets" do
    it "renders the widgets index and creates a tandem_content item called :widget_blurb" do
      get '/widgets'
    end
  end
end

