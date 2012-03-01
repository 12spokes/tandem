require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Users" do
  let(:user) { Factory(:user) }

  describe "logging in" do
    it "logs the user in" do
      visit '/users/sign_in'
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => 'secretSanta23$'
      click_button "Sign in"
    end
  end
end

