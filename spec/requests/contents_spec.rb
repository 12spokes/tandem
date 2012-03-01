require 'spec_helper'

describe "Tandem Content on non-tandem pages" do
  describe "get /widgets" do
    it "renders the widgets index and creates a tandem_content item called :widget_blurb" do
      get '/widgets'
    end
  end
end

