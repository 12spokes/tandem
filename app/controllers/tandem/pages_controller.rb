module Tandem
  class PagesController < ApplicationController
    load_and_authorize_resource
    layout :resource_layout

    # GET /pages/home
    # GET /pages.home.json
    def home
      #todo: need to build some special behavior here so that casual users are redirected to a specific 'default' page
      #respond_to do |format|
      #  format.html # home.html.erb
      #  format.json { render json: @pages }
      #end
    end

    # GET /pages
    # GET /pages.json
    def index
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pages }
      end
    end
  
    # GET /pages/1
    # GET /pages/1.json
    def show
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @page }
      end
    end
  
    # GET /pages/new
    # GET /pages/new.json
    def new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @page }
      end
    end
  
    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    # POST /pages.json
    def create
      respond_to do |format|
        if @page.save
          format.html { redirect_to @page, notice: 'Page was successfully created.' }
          format.json { render json: @page, status: :created, location: @page }
        else
          format.html { render action: "new" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /pages/1
    # PUT /pages/1.json
    def update
      respond_to do |format|
        if @page.update_attributes(params[:page])
          format.html { redirect_to @page, notice: 'Page was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /pages/1
    # DELETE /pages/1.json
    def destroy
      @page.destroy

      respond_to do |format|
        format.html { redirect_to pages_url }
        format.json { head :ok }
      end
    end

    private

    def resource_layout
      case params[:action]
        when 'show'
          layout_path(@page.try(:layout) || :page)
        when 'new', 'create', 'edit', 'update'
          layout_path :popup
        else
          layout_path :default
      end
    end
  end
end
