class TandemPagesController < ApplicationController
  # GET /tandem_pages
  # GET /tandem_pages.xml
  def index
    @tandem_pages = TandemPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tandem_pages }
    end
  end

  # GET /tandem_pages/1
  # GET /tandem_pages/1.xml
  def show
    @tandem_page = params[:token] ? TandemPage.find_by_token(params[:token]) : TandemPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tandem_page }
    end
  end

  # GET /tandem_pages/new
  # GET /tandem_pages/new.xml
  def new
    @tandem_page = TandemPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tandem_page }
    end
  end

  # GET /tandem_pages/1/edit
  def edit
    @tandem_page = TandemPage.find(params[:id])
  end

  # POST /tandem_pages
  # POST /tandem_pages.xml
  def create
    @tandem_page = TandemPage.new(params[:tandem_page])

    respond_to do |format|
      if @tandem_page.save
        flash[:notice] = 'TandemPage was successfully created.'
        format.html { redirect_to(@tandem_page) }
        format.xml  { render :xml => @tandem_page, :status => :created, :location => @tandem_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tandem_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tandem_pages/1
  # PUT /tandem_pages/1.xml
  def update
    @tandem_page = TandemPage.find(params[:id])

    respond_to do |format|
      if @tandem_page.update_attributes(params[:tandem_page])
        flash[:notice] = 'TandemPage was successfully updated.'
        format.html { redirect_to(@tandem_page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tandem_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tandem_pages/1
  # DELETE /tandem_pages/1.xml
  def destroy
    @tandem_page = TandemPage.find(params[:id])
    @tandem_page.destroy

    respond_to do |format|
      format.html { redirect_to(tandem_pages_url) }
      format.xml  { head :ok }
    end
  end
end
