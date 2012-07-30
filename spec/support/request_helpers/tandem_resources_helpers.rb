module RequestHelpers
  module TandemResourcesHelpers
    def when_i_go_to_the_resources_index_page
      visit bikes_path
    end

    def when_i_add_a_new_resource
      click_link 'New Bike'
      
      within '#new_bike' do
        fill_in 'Seats', :with => 2
        fill_in 'Color', :with => 'Pink'
        click_button 'Create Bike'
      end
    end

    def then_the_new_resource_should_be_created
      page.should have_content('2')
      page.should have_content('Pink')

      visit bikes_path

      page.should have_content('2')
      page.should have_content('Pink')
    end
  end
end
