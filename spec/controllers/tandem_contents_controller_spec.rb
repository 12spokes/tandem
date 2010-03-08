require 'spec_helper'

describe TandemContentsController do

  def mock_tandem_content(stubs={})
    @mock_tandem_content ||= mock_model(TandemContent, stubs)
  end

  describe "GET index" do
    it "assigns all tandem_contents as @tandem_contents" do
      TandemContent.stub(:find).with(:all).and_return([mock_tandem_content])
      get :index
      assigns[:tandem_contents].should == [mock_tandem_content]
    end
  end

  describe "GET show" do
    it "assigns the requested tandem_content as @tandem_content" do
      TandemContent.stub(:find).with("37").and_return(mock_tandem_content)
      get :show, :id => "37"
      assigns[:tandem_content].should equal(mock_tandem_content)
    end
  end

  describe "GET new" do
    it "assigns a new tandem_content as @tandem_content" do
      TandemContent.stub(:new).and_return(mock_tandem_content)
      get :new
      assigns[:tandem_content].should equal(mock_tandem_content)
    end
  end

  describe "GET edit" do
    it "assigns the requested tandem_content as @tandem_content" do
      TandemContent.stub(:find).with("37").and_return(mock_tandem_content)
      get :edit, :id => "37"
      assigns[:tandem_content].should equal(mock_tandem_content)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tandem_content as @tandem_content" do
        TandemContent.stub(:new).with({'these' => 'params'}).and_return(mock_tandem_content(:save => true))
        post :create, :tandem_content => {:these => 'params'}
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "redirects to the created tandem_content" do
        TandemContent.stub(:new).and_return(mock_tandem_content(:save => true))
        post :create, :tandem_content => {}
        response.should redirect_to(tandem_content_url(mock_tandem_content))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tandem_content as @tandem_content" do
        TandemContent.stub(:new).with({'these' => 'params'}).and_return(mock_tandem_content(:save => false))
        post :create, :tandem_content => {:these => 'params'}
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "re-renders the 'new' template" do
        TandemContent.stub(:new).and_return(mock_tandem_content(:save => false))
        post :create, :tandem_content => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tandem_content" do
        TandemContent.should_receive(:find).with("37").and_return(mock_tandem_content)
        mock_tandem_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tandem_content => {:these => 'params'}
      end

      it "assigns the requested tandem_content as @tandem_content" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => true))
        put :update, :id => "1"
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "redirects to the tandem_content" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tandem_content_url(mock_tandem_content))
      end
    end

    describe "with invalid params" do
      it "updates the requested tandem_content" do
        TandemContent.should_receive(:find).with("37").and_return(mock_tandem_content)
        mock_tandem_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tandem_content => {:these => 'params'}
      end

      it "assigns the tandem_content as @tandem_content" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => false))
        put :update, :id => "1"
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "re-renders the 'edit' template" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tandem_content" do
      TandemContent.should_receive(:find).with("37").and_return(mock_tandem_content)
      mock_tandem_content.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tandem_contents list" do
      TandemContent.stub(:find).and_return(mock_tandem_content(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tandem_contents_url)
    end
  end

end
