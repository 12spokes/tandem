require 'spec_helper'

describe "tandem resources" do
  include RequestHelpers::TandemResourcesHelpers

  it "should be able to create new resources" do
    when_i_go_to_the_resources_index_page
    when_i_add_a_new_resource
    then_the_new_resource_should_be_created
  end

  it "should be able to edit an existing resource" do
    given_a_yellow_two_seat_bike
    when_i_go_to_the_resources_index_page
    then_i_should_see_the_yellow_two_seat_bike
    when_i_edit_the_yellow_two_seat_bike
    then_i_should_see_my_updated_changes
  end
end
