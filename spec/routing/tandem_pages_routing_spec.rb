require 'spec_helper'

describe TandemPagesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/tandem_pages" }.should route_to(:controller => "tandem_pages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tandem_pages/new" }.should route_to(:controller => "tandem_pages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tandem_pages/1" }.should route_to(:controller => "tandem_pages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tandem_pages/1/edit" }.should route_to(:controller => "tandem_pages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tandem_pages" }.should route_to(:controller => "tandem_pages", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/tandem_pages/1" }.should route_to(:controller => "tandem_pages", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tandem_pages/1" }.should route_to(:controller => "tandem_pages", :action => "destroy", :id => "1") 
    end
  end
end
