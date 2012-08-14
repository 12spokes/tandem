module RequestHelpers
  module TandemResourcesHelpers
    def when_i_go_to_the_resources_index_page
      visit bikes_path
    end

    def when_i_add_a_new_resource(seats = 2, color = 'Pink')
      visit bikes_path

      click_link 'New Bike'
      
      sleep 0.5

      within '#new_bike' do
        fill_in 'Seats', :with => seats
        fill_in 'Color', :with => color
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

    def given_a_yellow_two_seat_bike
      when_i_add_a_new_resource(2, 'Yellow')
    end

    def then_i_should_see_the_yellow_two_seat_bike
      page.should have_content('2')
      page.should have_content('Yellow')
    end

    def when_i_edit_the_yellow_two_seat_bike
      within '.bike' do
        click_link 'Edit'
      end

      within '.edit_bike' do
        fill_in 'Seats', :with => 3
        fill_in 'Color', :with => 'Pink'
        click_button 'Update Bike'
      end
    end
    
    def then_i_should_see_my_updated_changes
      page.should have_content('3')
      page.should have_content('Pink')

      visit bikes_path

      page.should have_content('3')
      page.should have_content('Pink')
    end

    def when_i_delete_the_yellow_two_seat_bike
      within '.bike' do
        handle_js_confirm do
          click_link 'Delete'
        end
      end
    end

    def then_i_should_not_see_the_yellow_two_seat_bike
      visit bikes_path
      page.should_not have_content('2')
      page.should_not have_content('Yellow')
    end

    def handle_js_confirm(accept=true)
      page.evaluate_script "window.original_confirm_function = window.confirm"
      page.evaluate_script "window.confirm = function(msg) { return #{!!accept}; }"
      yield
    ensure
      page.evaluate_script "window.confirm = window.original_confirm_function"
    end
  end
end
