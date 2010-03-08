require 'spec_helper'

describe TandemContentsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/tandem_contents" }.should route_to(:controller => "tandem_contents", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tandem_contents/new" }.should route_to(:controller => "tandem_contents", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tandem_contents/1" }.should route_to(:controller => "tandem_contents", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tandem_contents/1/edit" }.should route_to(:controller => "tandem_contents", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tandem_contents" }.should route_to(:controller => "tandem_contents", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/tandem_contents/1" }.should route_to(:controller => "tandem_contents", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tandem_contents/1" }.should route_to(:controller => "tandem_contents", :action => "destroy", :id => "1") 
    end
  end
end
