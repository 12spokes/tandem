module Tandem
  class ContentsController < ::Tandem::ApplicationController
    load_and_authorize_resource
    layout 'tandem/popup'

=begin ### default scaffold actions not currently used
    # GET /contents
    # GET /contents.json
    def index
      @contents = @page.contents.all
      authorize_content!
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @contents }
      end
    end
  
    # GET /contents/1
    # GET /contents/1.json
    def show
      @content = @page.contents.find(params[:id])
      authorize_content!

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @content }
      end
    end
  
    # GET /contents/new
    # GET /contents/new.json
    def new
      @content = @page.contents.new
      authorize_content!

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @content }
      end
    end
  
    # POST /contents
    # POST /contents.json
    def create
      @content = Content::Text.new(params[:content].merge(:page_id => @page.id))
      authorize_content!

      respond_to do |format|
        if @content.save
          format.html { render action: "success", notice: 'Content was successfully created.' }
          format.json { render json: @content, status: :created, location: @content }
        else
          format.html { render action: "new" }
          format.json { render json: @content.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /contents/1
    # DELETE /contents/1.json
    def destroy
      @content = @page.contents.find(params[:id])
      authorize_content!

      @content.destroy

      respond_to do |format|
        format.html { redirect_to page_contents_url }
        format.json { head :ok }
      end
    end

=end

    # GET /contents/1/edit
    def edit
    end

    # PUT /contents/1
    # PUT /contents/1.json
    def update
      param_key = ActiveModel::Naming.param_key(@content)

      respond_to do |format|
        if @content.update_attributes(params[param_key])
          format.json { render json: @content }
        else
          format.json { render json: @content.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
