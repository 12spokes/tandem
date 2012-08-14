module Tandem
	class ResourcesController < ::Tandem::ApplicationController
    load_and_authorize_resource

    layout 'application'

    def index
    end

    def show
    end
    
    def new
      respond_to do |format|
        format.html { render layout: false if request.xhr? }
      end
    end
    
    def edit
      respond_to do |format|
        format.html { render layout: false if request.xhr? }
      end
    end

    def create
      respond_to do |format|
        if instance_variable_get("@#{resource_name}").save
          format.html { redirect_to instance_variable_get("@#{resource_name}"), notice: "#{resource_name.capitalize} was successfully created." }
          format.json { render json: instance_variable_get("@#{resource_name}"), status: :created, location: instance_variable_get("@#{resource_name}") }
        else
          format.html { render action: "new" }
          format.json { render json: instance_variable_get("@#{resource_name}").errors, status: :unprocessable_entity }
        end
      end
    end
    
    def update
      respond_to do |format|
        if instance_variable_get("@#{resource_name}").update_attributes(params[resource_name.to_sym])
          format.html { redirect_to instance_variable_get("@#{resource_name}"), notice: "#{resource_name.capitalize} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: instance_variable_get("@#{resource_name}").errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      instance_variable_get("@#{resource_name}").destroy

      respond_to do |format|
        format.html { redirect_to send("#{resource_name.pluralize}_url".to_sym) }
        format.json { head :no_content }
      end
    end

    private
    def resource_name
      @resource_name ||= controller_name.singularize
    end
  end
end
