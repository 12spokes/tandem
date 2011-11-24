module Tandem
  require "spec_helper"

  describe PagesController do
    #http://stackoverflow.com/questions/7691594/how-to-test-routes-in-a-rails-3-1-mountable-engine
    before(:each) { @routes = Engine.routes }

    describe "routing" do

      it "routes to #index" do
        get("/pages").should route_to("tandem/pages#index")
      end

      it "routes to #new" do
        get("/pages/new").should route_to("tandem/pages#new")
      end

      it "routes to #show" do
        get("/pages/1").should route_to("tandem/pages#show", :id => "1")
      end

      it "routes to #edit" do
        get("/pages/1/edit").should route_to("tandem/pages#edit", :id => "1")
      end

      it "routes to #create" do
        post("/pages").should route_to("tandem/pages#create")
      end

      it "routes to #update" do
        put("/pages/1").should route_to("tandem/pages#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/pages/1").should route_to("tandem/pages#destroy", :id => "1")
      end

    end
  end
end