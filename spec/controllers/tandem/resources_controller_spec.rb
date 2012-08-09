module Tandem
  require 'spec_helper'

  class Resource
  end

  describe Tandem::ResourcesController do
    let(:resource) { double(Resource) }

    before do
      Resource.stub(:new) { resource }
      Resource.stub(:find).with('1') { resource }
      controller.stub(:url_for).with(resource) { '/resources/1' }
    end

    describe 'create' do
      before do
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
          subject
        end
      end
    end

    describe 'update' do
      before do
        resource.stub(:update_attributes) { true }
      end

      subject do
        put :update, id: 1, resource: { seats: 2 }
        response
      end

      it 'should create an instance variable @resource' do
        subject
        assigns(:resource).should eql(resource)
      end

      context 'for valid parameters' do
        it { should redirect_to("/resources/1") }

        it 'should create a flash message indicating success' do
          subject
          flash[:notice].should == 'Resource was successfully updated.'
        end
      end

      context 'for invalid parameters' do
        before do
          resource.stub(:update_attributes) { false }
        end

        it 'should render the edit action' do
          controller.stub(:render) { true }
          controller.should_receive(:render).with(action: 'edit') { true }
          subject
        end
      end
    end
  end
end
