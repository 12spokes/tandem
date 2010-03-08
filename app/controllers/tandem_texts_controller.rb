class TandemTextsController < ApplicationController
  # GET /tandem_texts
  # GET /tandem_texts.xml
  def index
    @tandem_texts = TandemText.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tandem_texts }
    end
  end

  # GET /tandem_texts/1
  # GET /tandem_texts/1.xml
  def show
    @tandem_text = TandemText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tandem_text }
    end
  end

  # GET /tandem_texts/new
  # GET /tandem_texts/new.xml
  def new
    @tandem_text = TandemText.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tandem_text }
    end
  end

  # GET /tandem_texts/1/edit
  def edit
    @tandem_text = TandemText.find(params[:id])
  end

  # POST /tandem_texts
  # POST /tandem_texts.xml
  def create
    @tandem_text = TandemText.new(params[:tandem_text])

    respond_to do |format|
      if @tandem_text.save
        flash[:notice] = 'TandemText was successfully created.'
        format.html { redirect_to(@tandem_text) }
        format.xml  { render :xml => @tandem_text, :status => :created, :location => @tandem_text }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tandem_text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tandem_texts/1
  # PUT /tandem_texts/1.xml
  def update
    @tandem_text = TandemText.find(params[:id])

    respond_to do |format|
      if @tandem_text.update_attributes(params[:tandem_text])
        flash[:notice] = 'TandemText was successfully updated.'
        format.html { redirect_to(@tandem_text) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tandem_text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tandem_texts/1
  # DELETE /tandem_texts/1.xml
  def destroy
    @tandem_text = TandemText.find(params[:id])
    @tandem_text.destroy

    respond_to do |format|
      format.html { redirect_to(tandem_texts_url) }
      format.xml  { head :ok }
    end
  end
end
