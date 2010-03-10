class TandemContentsController < ApplicationController
  before_filter :load_tandem_page
  
  # GET /tandem_contents
  # GET /tandem_contents.xml
  def index
    @tandem_contents = TandemContent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tandem_contents }
    end
  end

  # GET /tandem_contents/1
  # GET /tandem_contents/1.xml
  def show
    @tandem_content = TandemContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tandem_content }
    end
  end

  # GET /tandem_contents/new
  # GET /tandem_contents/new.xml
  def new
    @tandem_content = TandemContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tandem_content }
    end
  end

  # GET /tandem_contents/1/edit
  def edit
    @tandem_content = TandemContent.find(params[:id])
  end

  # POST /tandem_contents
  # POST /tandem_contents.xml
  def create
    @tandem_content = TandemContent.new(params[:tandem_content])

    respond_to do |format|
      if @tandem_content.save
        flash[:notice] = 'TandemContent was successfully created.'
        format.html { redirect_to([@tandem_page, @tandem_content]) }
        format.xml  { render :xml => @tandem_content, :status => :created, :location => @tandem_content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tandem_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tandem_contents/1
  # PUT /tandem_contents/1.xml
  def update
    @tandem_content = TandemContent.find(params[:id])

    respond_to do |format|
      if @tandem_content.update_attributes(params[:tandem_content])
        flash[:notice] = 'TandemContent was successfully updated.'
        format.html { redirect_to([@tandem_page, @tandem_content]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tandem_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tandem_contents/1
  # DELETE /tandem_contents/1.xml
  def destroy
    @tandem_content = TandemContent.find(params[:id])
    @tandem_content.destroy

    respond_to do |format|
      format.html { redirect_to(tandem_page_tandem_contents_url(@tandem_page)) }
      format.xml  { head :ok }
    end
  end
  
  private
    def load_tandem_page
      @tandem_page = TandemPage.find(params[:tandem_page_id])
    end
end
