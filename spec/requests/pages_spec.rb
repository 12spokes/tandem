require 'spec_helper'

describe "Pages" do
  include RequestHelpers::PagesHelpers

  before(:each) do
    Factory(:tandem_page)
  end

  describe "get /tandem" do
    it "renders the home page" do
      get '/tandem'
    end
  end

  describe 'creating a new page' do
    context 'by submitting a valid form' do
      it 'shows the page form and creates a new page', :js => true do
        when_I_go_to_the_home_page_and_click_new_page
        i_should_see_the_new_page_form_in_a_modalbox
        when_I_fill_out_the_page_form_and_hit_save
        then_I_should_see_the_new_page_in_the_page_listings
        and_I_should_be_able_to_visit_the_new_page
      end
    end

    context 'by submitting an invalid form' do
      it 'should show the errors on the form within the colorbox', :js => true do
        when_I_go_to_the_home_page_and_click_new_page
        i_should_see_the_new_page_form_in_a_modalbox
        when_I_submit_a_blank_page_form
        then_I_should_see_errors_in_page_form
      end
    end
  end
end
