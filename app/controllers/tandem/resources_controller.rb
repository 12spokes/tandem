module Tandem
	class ResourcesController < ::Tandem::ApplicationController
    load_and_authorize_resource

    def index
    end

    def show
    end
    
    def new
    end
    
    def edit
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
    end

    def destroy
    end

    private
    def resource_name
      @resource_name ||= controller_name.singularize
    end
  end
end
