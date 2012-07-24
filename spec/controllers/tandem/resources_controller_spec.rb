module Tandem
  require 'spec_helper'

  class Resource
  end

  describe Tandem::ResourcesController do
    let(:resource) { double(Resource) }

    before do
      Resource.stub(:new) { resource }
    end

    describe 'create' do
      before do
        controller.stub(:url_for).with(resource) { '/resources/1' }
        resource.stub(:save) { true }
      end

      subject do
        post :create, resource: { seats: 2 }
        response
      end

      it 'should create an instance variable @resource' do
        subject
        assigns(:resource).should eql(resource)
      end

      context 'for a valid resource' do
        it { should redirect_to("/resources/1") }

        it 'should create a flash message indicating success' do
          subject
          flash[:notice].should == 'Resource was successfully created.'
        end
      end

      context 'for an invalid resource' do
        before do
          resource.stub(:save) { false }
        end

        it 'should render the new action' do
          controller.stub(:render) { true }
          controller.should_receive(:render).with(action: 'new') { true }
          post :create, resource: { seats: 2 }
        end
      end
    end
  end
end
