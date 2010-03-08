require 'spec_helper'

describe TandemTextsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/tandem_texts" }.should route_to(:controller => "tandem_texts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tandem_texts/new" }.should route_to(:controller => "tandem_texts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tandem_texts/1" }.should route_to(:controller => "tandem_texts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tandem_texts/1/edit" }.should route_to(:controller => "tandem_texts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tandem_texts" }.should route_to(:controller => "tandem_texts", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/tandem_texts/1" }.should route_to(:controller => "tandem_texts", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tandem_texts/1" }.should route_to(:controller => "tandem_texts", :action => "destroy", :id => "1") 
    end
  end
end
