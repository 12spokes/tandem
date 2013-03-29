require 'spec_helper'

describe "Editing" do
  include RequestHelpers::GeneralHelpers

  describe "text content" do
    it "changes the content", :js => true do
      visit root_path
      edit_tandem_text_content(:tandem_text_block, 'I love tandem!')

      within '#content_text_tandem_text_block' do
        page.should have_content('I love tandem!')
      end
    end
  end
end

describe "Tandem Content on non-tandem pages" do
  describe "get /widgets" do
    it "renders the widgets index and creates a tandem content items" do
      visit '/widgets'
    end
  end
end

