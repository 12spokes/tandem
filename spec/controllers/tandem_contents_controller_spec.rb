require File.dirname(__FILE__) + '/../spec_helper'

describe TandemContentsController do

  def mock_tandem_content(stubs={})
    @mock_tandem_content ||= mock_model(TandemContent, stubs)
  end
  
  before do
    @tandem_page = mock_model(TandemPage)
    TandemPage.stub(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
  end

  describe "GET index" do
    it "assigns all tandem_contents as @tandem_contents" do
      TandemContent.stub(:find).with(:all).and_return([mock_tandem_content])
      get :index, :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_contents].should == [mock_tandem_content]
    end
    
    it 'loads the tandem_page' do
      TandemPage.should_receive(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
      get :index, :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_page].should == @tandem_page
    end
  end

  describe "GET show" do
    before do
      TandemContent.stub(:find).with("37").and_return(mock_tandem_content)
    end
    
    it "assigns the requested tandem_content as @tandem_content" do
      get :show, :id => "37", :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_content].should equal(mock_tandem_content)
    end
    
    it 'loads the tandem_page' do
      TandemPage.should_receive(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
      get :show, :id => "37", :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_page].should == @tandem_page
    end
  end

  describe "GET new" do
    before do
      TandemContent.stub(:new).and_return(mock_tandem_content)
    end
    
    it "assigns a new tandem_content as @tandem_content" do
      get :new, :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_content].should equal(mock_tandem_content)
    end
    
    it 'loads the tandem_page' do
      TandemPage.should_receive(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
      get :new, :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_page].should == @tandem_page
    end
  end

  describe "GET edit" do
    before do
      TandemContent.stub(:find).with("37").and_return(mock_tandem_content)
    end
    
    it "assigns the requested tandem_content as @tandem_content" do
      get :edit, :id => "37", :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_content].should equal(mock_tandem_content)
    end
    
    it 'loads the tandem_page' do
      TandemPage.should_receive(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
      get :edit, :id => "37", :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_page].should == @tandem_page
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tandem_content as @tandem_content" do
        TandemContent.stub(:new).with(hash_including('these' => 'params')).and_return(mock_tandem_content(:save => true))
        post :create, :tandem_content => {:these => 'params'}, :tandem_page_id => @tandem_page.id.to_s
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "redirects to the created tandem_content" do
        TandemContent.stub(:new).and_return(mock_tandem_content(:save => true))
        post :create, :tandem_content => {}, :tandem_page_id => @tandem_page.id.to_s
        response.should redirect_to(tandem_page_tandem_content_url(@tandem_page.id, mock_tandem_content))
      end
      
      it 'loads the tandem_page' do
        TandemContent.stub(:new).and_return(mock_tandem_content(:save => true))
        TandemPage.should_receive(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
        post :create, :tandem_content => {}, :tandem_page_id => @tandem_page.id.to_s
        assigns[:tandem_page].should == @tandem_page
      end
      
      it 'should associate the new TandemContent with the TandemPage' do
        TandemContent.should_receive(:new).with(hash_including(:tandem_page_id => @tandem_page.id)).and_return(mock_tandem_content(:save => true))
        post :create, :tandem_content => {}, :tandem_page_id => @tandem_page.id.to_s
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tandem_content as @tandem_content" do
        TandemContent.stub(:new).with(hash_including('these' => 'params')).and_return(mock_tandem_content(:save => false))
        post :create, :tandem_content => {:these => 'params'}, :tandem_page_id => @tandem_page.id.to_s
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "re-renders the 'new' template" do
        TandemContent.stub(:new).and_return(mock_tandem_content(:save => false))
        post :create, :tandem_content => {}, :tandem_page_id => @tandem_page.id.to_s
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tandem_content" do
        TandemContent.should_receive(:find).with("37").and_return(mock_tandem_content)
        mock_tandem_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tandem_content => {:these => 'params'}, :tandem_page_id => @tandem_page.id.to_s
      end

      it "assigns the requested tandem_content as @tandem_content" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => true))
        put :update, :id => "1", :tandem_page_id => @tandem_page.id.to_s
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "redirects to the tandem_content" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => true))
        put :update, :id => "1", :tandem_page_id => @tandem_page.id.to_s
        response.should redirect_to(tandem_page_tandem_content_url(@tandem_page.id, mock_tandem_content))
      end
      
      it 'loads the tandem_page' do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => true))
        TandemPage.should_receive(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
        put :update, :id => "1", :tandem_page_id => @tandem_page.id.to_s
        assigns[:tandem_page].should == @tandem_page
      end
    end

    describe "with invalid params" do
      it "updates the requested tandem_content" do
        TandemContent.should_receive(:find).with("37").and_return(mock_tandem_content)
        mock_tandem_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tandem_content => {:these => 'params'}, :tandem_page_id => @tandem_page.id.to_s
      end

      it "assigns the tandem_content as @tandem_content" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => false))
        put :update, :id => "1", :tandem_page_id => @tandem_page.id.to_s
        assigns[:tandem_content].should equal(mock_tandem_content)
      end

      it "re-renders the 'edit' template" do
        TandemContent.stub(:find).and_return(mock_tandem_content(:update_attributes => false))
        put :update, :id => "1", :tandem_page_id => @tandem_page.id.to_s
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tandem_content" do
      TandemContent.should_receive(:find).with("37").and_return(mock_tandem_content)
      mock_tandem_content.should_receive(:destroy)
      delete :destroy, :id => "37", :tandem_page_id => @tandem_page.id.to_s
    end

    it "redirects to the tandem_contents list" do
      TandemContent.stub(:find).and_return(mock_tandem_content(:destroy => true))
      delete :destroy, :id => "1", :tandem_page_id => @tandem_page.id.to_s
      response.should redirect_to(tandem_page_tandem_contents_url(@tandem_page.id))
    end
    
    it 'loads the tandem_page' do
      TandemContent.stub(:find).and_return(mock_tandem_content(:destroy => true))
      TandemPage.should_receive(:find).with(@tandem_page.id.to_s).and_return(@tandem_page)
      delete :destroy, :id => "1", :tandem_page_id => @tandem_page.id.to_s
      assigns[:tandem_page].should == @tandem_page
    end
  end

end
