module Tandem
  require "spec_helper"

  describe ContentsController do
    before(:each) { @routes = Engine.routes }

    describe "routing" do

=begin ### default scaffold actions not currently used
      it "routes to #index" do
        get("/pages/1/contents").should route_to("tandem/contents#index", :page_id => "1")
      end

      it "routes to #new" do
        get("/pages/1/contents/new").should route_to("tandem/contents#new", :page_id => "1")
      end

      it "routes to #show" do
        get("/pages/1/contents/1").should route_to("tandem/contents#show", :page_id => "1", :id => "1")
      end

      it "routes to #create" do
        post("/pages/1/contents").should route_to("tandem/contents#create", :page_id => "1")
      end

      it "routes to #destroy" do
        delete("/pages/1/contents/1").should route_to("tandem/contents#destroy", :page_id => "1", :id => "1")
      end
=end

      it "routes to #edit" do
        get("/pages/1/contents/1/edit").should route_to("tandem/contents#edit", :page_id => "1", :id => "1")
      end

      it "routes to #update" do
        put("/pages/1/contents/1").should route_to("tandem/contents#update", :page_id => "1", :id => "1")
      end

    end
  end
end