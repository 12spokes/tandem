require File.dirname(__FILE__) + '/../spec_helper'

describe TandemPagesController do

  def mock_tandem_page(stubs={})
    @mock_tandem_page ||= mock_model(TandemPage, stubs)
  end
  
  describe 'someone who cannot edit tandem content' do
    it_should_behave_like "someone who cannot edit tandem content"
    
    bar_actions([:get,    :index],
                [:get,    :new],
                [:get,    :edit],
                [:post,   :create],
                [:put,    :update],
                [:delete, :destroy])
                
    describe "GET show" do
      it "assigns the requested tandem_page as @tandem_page if passed an id" do
        TandemPage.should_receive(:find).with("37").and_return(mock_tandem_page)
        get :show, :id => "37"
        assigns[:tandem_page].should equal(mock_tandem_page)
      end

      it "assigns the requested tandem_page as @tandem_page if passed a token" do
        TandemPage.should_receive(:find_by_token).with("super_tandem_page").and_return(mock_tandem_page)
        get :show, :token => "super_tandem_page"
        assigns[:tandem_page].should equal(mock_tandem_page)
      end
    end
  end
  
  describe 'someone who can edit tandem content' do
    it_should_behave_like "someone who can edit tandem content"

    describe "GET index" do
      it "assigns all tandem_pages as @tandem_pages" do
        TandemPage.stub(:find).with(:all).and_return([mock_tandem_page])
        get :index
        assigns[:tandem_pages].should == [mock_tandem_page]
      end
    end

    describe "GET show" do
      it "assigns the requested tandem_page as @tandem_page if passed an id" do
        TandemPage.should_receive(:find).with("37").and_return(mock_tandem_page)
        get :show, :id => "37"
        assigns[:tandem_page].should equal(mock_tandem_page)
      end
    
      it "assigns the requested tandem_page as @tandem_page if passed a token" do
        TandemPage.should_receive(:find_by_token).with("super_tandem_page").and_return(mock_tandem_page)
        get :show, :token => "super_tandem_page"
        assigns[:tandem_page].should equal(mock_tandem_page)
      end
    end

    describe "GET new" do
      it "assigns a new tandem_page as @tandem_page" do
        TandemPage.stub(:new).and_return(mock_tandem_page)
        get :new
        assigns[:tandem_page].should equal(mock_tandem_page)
      end
    end

    describe "GET edit" do
      it "assigns the requested tandem_page as @tandem_page" do
        TandemPage.stub(:find).with("37").and_return(mock_tandem_page)
        get :edit, :id => "37"
        assigns[:tandem_page].should equal(mock_tandem_page)
      end
    end

    describe "POST create" do

      describe "with valid params" do
        it "assigns a newly created tandem_page as @tandem_page" do
          TandemPage.stub(:new).with({'these' => 'params'}).and_return(mock_tandem_page(:save => true))
          post :create, :tandem_page => {:these => 'params'}
          assigns[:tandem_page].should equal(mock_tandem_page)
        end

        it "redirects to the created tandem_page" do
          TandemPage.stub(:new).and_return(mock_tandem_page(:save => true))
          post :create, :tandem_page => {}
          response.should redirect_to(tandem_page_url(mock_tandem_page))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved tandem_page as @tandem_page" do
          TandemPage.stub(:new).with({'these' => 'params'}).and_return(mock_tandem_page(:save => false))
          post :create, :tandem_page => {:these => 'params'}
          assigns[:tandem_page].should equal(mock_tandem_page)
        end

        it "re-renders the 'new' template" do
          TandemPage.stub(:new).and_return(mock_tandem_page(:save => false))
          post :create, :tandem_page => {}
          response.should render_template('new')
        end
      end

    end

    describe "PUT update" do

      describe "with valid params" do
        it "updates the requested tandem_page" do
          TandemPage.should_receive(:find).with("37").and_return(mock_tandem_page)
          mock_tandem_page.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :tandem_page => {:these => 'params'}
        end

        it "assigns the requested tandem_page as @tandem_page" do
          TandemPage.stub(:find).and_return(mock_tandem_page(:update_attributes => true))
          put :update, :id => "1"
          assigns[:tandem_page].should equal(mock_tandem_page)
        end

        it "redirects to the tandem_page" do
          TandemPage.stub(:find).and_return(mock_tandem_page(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(tandem_page_url(mock_tandem_page))
        end
      end

      describe "with invalid params" do
        it "updates the requested tandem_page" do
          TandemPage.should_receive(:find).with("37").and_return(mock_tandem_page)
          mock_tandem_page.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :tandem_page => {:these => 'params'}
        end

        it "assigns the tandem_page as @tandem_page" do
          TandemPage.stub(:find).and_return(mock_tandem_page(:update_attributes => false))
          put :update, :id => "1"
          assigns[:tandem_page].should equal(mock_tandem_page)
        end

        it "re-renders the 'edit' template" do
          TandemPage.stub(:find).and_return(mock_tandem_page(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end
      end

    end

    describe "DELETE destroy" do
      it "destroys the requested tandem_page" do
        TandemPage.should_receive(:find).with("37").and_return(mock_tandem_page)
        mock_tandem_page.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the tandem_pages list" do
        TandemPage.stub(:find).and_return(mock_tandem_page(:destroy => true))
        delete :destroy, :id => "1"
        response.should redirect_to(tandem_pages_url)
      end
    end
  end
end
