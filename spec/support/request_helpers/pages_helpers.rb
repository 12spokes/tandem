module RequestHelpers
  module PagesHelpers
    def when_I_go_to_the_home_page_and_click_new_page
      visit root_path
      click_link 'New Page'
    end
      
    def i_should_see_the_new_page_form_in_a_modalbox
      sleep 1
      within '#colorbox' do
        page.should have_selector('form.tandem-page-form')
      end
    end
      
    def when_I_fill_out_the_page_form_and_hit_save
      within 'form.tandem-page-form' do
        fill_in 'Title', :with => 'cherries'
        fill_in 'Link label', :with => 'cherries'
        fill_in 'Slug', :with => 'cherries'
        click_button 'Save'
      end
    end
      
    def then_I_should_see_the_new_page_in_the_page_listings
      visit '/tandem/pages'
      page.should have_content('cherries')
    end
      
    def and_I_should_be_able_to_visit_the_new_page
      visit '/tandem/pages/cherries'
      page.should have_content('Sample Content')
    end

    def when_I_submit_a_blank_page_form
      within 'form.tandem-page-form' do
        click_button 'Save'
      end
    end
        
    def then_I_should_see_errors_in_page_form
      within '#colorbox' do
        page.should have_selector('form.tandem-page-form')

        within 'form.tandem-page-form' do
          page.should have_selector('#error_explanation')
        end
      end
    end
  end
end

