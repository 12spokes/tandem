require File.dirname(__FILE__) + '/../spec_helper'

describe TandemTextsController do

  def mock_tandem_text(stubs={})
    @mock_tandem_text ||= mock_model(TandemText, stubs)
  end

  describe 'someone who cannot edit tandem content' do
    it_should_behave_like "someone who cannot edit tandem content"
    
    bar_actions([:get,    :index],
                [:get,    :show],
                [:get,    :new],
                [:get,    :edit],
                [:post,   :create],
                [:put,    :update],
                [:delete, :destroy])
  end
  
  describe 'someone who can edit tandem content' do
    it_should_behave_like "someone who can edit tandem content"
    
    describe "GET index" do
      it "assigns all tandem_texts as @tandem_texts" do
        TandemText.stub(:find).with(:all).and_return([mock_tandem_text])
        get :index
        assigns[:tandem_texts].should == [mock_tandem_text]
      end
    end

    describe "GET show" do
      it "assigns the requested tandem_text as @tandem_text" do
        TandemText.stub(:find).with("37").and_return(mock_tandem_text)
        get :show, :id => "37"
        assigns[:tandem_text].should equal(mock_tandem_text)
      end
    end

    describe "GET new" do
      it "assigns a new tandem_text as @tandem_text" do
        TandemText.stub(:new).and_return(mock_tandem_text)
        get :new
        assigns[:tandem_text].should equal(mock_tandem_text)
      end
    end

    describe "GET edit" do
      it "assigns the requested tandem_text as @tandem_text" do
        TandemText.stub(:find).with("37").and_return(mock_tandem_text)
        get :edit, :id => "37"
        assigns[:tandem_text].should equal(mock_tandem_text)
      end
    end

    describe "POST create" do

      describe "with valid params" do
        it "assigns a newly created tandem_text as @tandem_text" do
          TandemText.stub(:new).with({'these' => 'params'}).and_return(mock_tandem_text(:save => true))
          post :create, :tandem_text => {:these => 'params'}
          assigns[:tandem_text].should equal(mock_tandem_text)
        end

        it "redirects to the created tandem_text" do
          TandemText.stub(:new).and_return(mock_tandem_text(:save => true))
          post :create, :tandem_text => {}
          response.should redirect_to(tandem_text_url(mock_tandem_text))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved tandem_text as @tandem_text" do
          TandemText.stub(:new).with({'these' => 'params'}).and_return(mock_tandem_text(:save => false))
          post :create, :tandem_text => {:these => 'params'}
          assigns[:tandem_text].should equal(mock_tandem_text)
        end

        it "re-renders the 'new' template" do
          TandemText.stub(:new).and_return(mock_tandem_text(:save => false))
          post :create, :tandem_text => {}
          response.should render_template('new')
        end
      end

    end

    describe "PUT update" do

      describe "with valid params" do
        it "updates the requested tandem_text" do
          TandemText.should_receive(:find).with("37").and_return(mock_tandem_text)
          mock_tandem_text.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :tandem_text => {:these => 'params'}
        end

        it "assigns the requested tandem_text as @tandem_text" do
          TandemText.stub(:find).and_return(mock_tandem_text(:update_attributes => true))
          put :update, :id => "1"
          assigns[:tandem_text].should equal(mock_tandem_text)
        end

        it "redirects to the tandem_text" do
          TandemText.stub(:find).and_return(mock_tandem_text(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(tandem_text_url(mock_tandem_text))
        end
      end

      describe "with invalid params" do
        it "updates the requested tandem_text" do
          TandemText.should_receive(:find).with("37").and_return(mock_tandem_text)
          mock_tandem_text.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :tandem_text => {:these => 'params'}
        end

        it "assigns the tandem_text as @tandem_text" do
          TandemText.stub(:find).and_return(mock_tandem_text(:update_attributes => false))
          put :update, :id => "1"
          assigns[:tandem_text].should equal(mock_tandem_text)
        end

        it "re-renders the 'edit' template" do
          TandemText.stub(:find).and_return(mock_tandem_text(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end
      end

    end

    describe "DELETE destroy" do
      it "destroys the requested tandem_text" do
        TandemText.should_receive(:find).with("37").and_return(mock_tandem_text)
        mock_tandem_text.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the tandem_texts list" do
        TandemText.stub(:find).and_return(mock_tandem_text(:destroy => true))
        delete :destroy, :id => "1"
        response.should redirect_to(tandem_texts_url)
      end
    end
  end
end
