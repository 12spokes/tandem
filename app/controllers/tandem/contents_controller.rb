module Tandem
  class ContentsController < ApplicationController
    # GET /contents
    # GET /contents.json
    def index
      @contents = Content::Text.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @contents }
      end
    end
  
    # GET /contents/1
    # GET /contents/1.json
    def show
      @content = Content::Text.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @content }
      end
    end
  
    # GET /contents/new
    # GET /contents/new.json
    def new
      @content = Content::Text.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @content }
      end
    end
  
    # GET /contents/1/edit
    def edit
      @content = Content::Text.find(params[:id])
    end
  
    # POST /contents
    # POST /contents.json
    def create
      puts params[:content].inspect
      @content = Content::Text.new(params[:content])
  
      respond_to do |format|
        if @content.save
          puts 'here1***'
          format.html { redirect_to content_url(@content), notice: 'Content was successfully created.' }
          format.json { render json: @content, status: :created, location: @content }
        else
          puts 'here2***'
          format.html { render action: "new" }
          format.json { render json: @content.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /contents/1
    # PUT /contents/1.json
    def update
      @content = Content::Text.find(params[:id])
  
      respond_to do |format|
        if @content.update_attributes(params[:content])
          format.html { redirect_to content_url(@content), notice: 'Content was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @content.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /contents/1
    # DELETE /contents/1.json
    def destroy
      @content = Content::Text.find(params[:id])
      @content.destroy
  
      respond_to do |format|
        format.html { redirect_to contents_url }
        format.json { head :ok }
      end
    end
  end
end
