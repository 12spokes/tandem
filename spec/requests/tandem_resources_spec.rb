require 'spec_helper'

describe "Creating a new tandem resource" do
  include RequestHelpers::TandemResourcesHelpers

  it "should create the new resource" do
    when_i_go_to_the_resources_index_page
    when_i_add_a_new_resource
    then_the_new_resource_should_be_created
  end
end
