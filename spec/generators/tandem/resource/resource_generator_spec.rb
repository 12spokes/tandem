require 'spec_helper'
require "generators/tandem/resource/resource_generator"

describe Tandem::Generators::ResourceGenerator do
  destination File.expand_path("#{ENGINE_RAILS_ROOT}/spec/dummy/tmp", __FILE__)

  before do
    prepare_destination

    FileUtils.mkdir_p("#{destination_root}/config")
    FileUtils.cp "#{ENGINE_RAILS_ROOT}/config/routes.rb", "#{destination_root}/config/routes.rb"
  end

  describe 'tandem resource controller' do
    before do
      run_generator %w(Spoke) # Would like to figure out how to not specify --orm active_record 
    end

    subject { file('app/controllers/spokes_controller.rb') }

    it { should contain(/class SpokesController < ::Tandem::ResourcesController/) }
  end

  describe 'tandem resource views' do
    before do
      run_generator %w(Spoke)
    end

    describe 'index.html.slim' do
      subject { file('app/views/spokes/index.html.slim') }
      it { should contain(/Spokes:/) }
    end

    describe 'show.html.slim' do
      subject { file('app/views/spokes/show.html.slim') }
      it { should exist }
    end

    describe 'new.html.slim' do
      subject { file('app/views/spokes/new.html.slim') }
      it { should exist }
    end

    describe 'edit.html.slim' do
      subject { file('app/views/spokes/edit.html.slim') }
      it { should exist }
    end

    describe '_form.html.slim' do
      subject { file('app/views/spokes/_form.html.slim') }
      it { should exist }
    end
  end

  describe 'tandem resource routes' do
    before do
      run_generator %w(Spoke)
    end

    subject { file('config/routes.rb') }
    it { should contain(/resources :spokes/) }
  end

  describe 'tandem resource migration' do
    before do
      run_generator %w(Spoke name:string)
    end

    subject { file('db/migrate/create_spokes.rb') }
    
    it { should be_a_migration }
  end

  describe '#add_image_to_model' do
    context 'no image flag on command line' do
      before do 
        run_generator %w(Spoke)
      end

      it 'should not add image handling to the model' do
        text = file('app/models/spoke.rb')
        text.should_not contain(/has_attached_file :image/)
      end
    
      it 'should not add image handling to the show page' do
        text = file('app/views/spokes/show.html.slim')
        text.should_not contain(/image_tag @spoke.image.url/)
      end

      it 'should not add image handling to the edit form' do
        text = file('app/views/spokes/_form.html.slim')
        text.should_not contain(/f.file_field :image/)
      end

      it 'should not add html flag to _form.html.slim' do
        text = file('app/views/spokes/_form.html.slim')
        text.should_not contain(/:html => { :multipart => true }/)
      end
    end

    context 'image flag on command line' do
      before do 
        run_generator %w(Spoke --with_image)
      end

      it 'should add image handling to the model' do
        text = file('app/models/spoke.rb')
        text.should contain(/has_attached_file :image/)
      end
    
      it 'should add image handling to the show page' do
        text = file('app/views/spokes/show.html.slim')
        text.should contain(/image_tag @spoke.image.url/)
      end

      it 'should add image handling to the edit form' do
        text = file('app/views/spokes/_form.html.slim')
        text.should contain(/f.file_field :image/)
      end
      
      it 'should add html flag to _form.html.slim' do
        text = file('app/views/spokes/_form.html.slim')
        text.should contain(/:html => { :multipart => true }/)
      end
    end
  end
end
