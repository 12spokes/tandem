module Tandem
  class ImagesController < ApplicationController
    load_and_authorize_resource

    # GET /images
    # GET /images.json
    def index
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @images }
      end
    end
  
    # GET /images/1
    # GET /images/1.json
    def show
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @image }
      end
    end
  
    # GET /images/new
    # GET /images/new.json
    def new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @image }
      end
    end
  
    # GET /images/1/edit
    def edit
    end
  
    # POST /images
    # POST /images.json
    def create
      respond_to do |format|
        if @image.save
          format.html { redirect_to @image, notice: 'Image was successfully created.' }
          format.json { render json: @image, status: :created, location: @image }
        else
          format.html { render action: "new" }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /images/1
    # PUT /images/1.json
    def update
      respond_to do |format|
        if @image.update_attributes(params[:image])
          format.html { redirect_to @image, notice: 'Image was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /images/1
    # DELETE /images/1.json
    def destroy
      @image.destroy
  
      respond_to do |format|
        format.html { redirect_to images_url }
        format.json { head :ok }
      end
    end
  end
end
