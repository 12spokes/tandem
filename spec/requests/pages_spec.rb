require 'spec_helper'

describe "Pages" do
  before(:each) do
    Factory(:tandem_page)
  end

  describe "get /tandem" do
    it "renders the home page" do
      get '/tandem'
    end
  end
end
