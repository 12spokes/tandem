module Tandem
  class Content < ActiveRecord::Base
    #in dev mode, subclasses won't work if they aren't preloaded
    if ::Rails.env.development?
      Dir["#{File.dirname(__FILE__)}/content/**/*.rb"].each do |model|
        require_or_load model
      end
    end

    belongs_to :page

    validates_presence_of :page_id, :tag, :type
    validates_uniqueness_of :page_id, :scope => [:tag, :type]

    #enforce abstract class architecture
    validates_exclusion_of :type, :in => [self.name]

    def self.simple_type
      self.name.split('::').last.downcase
    end

    def self.scoped_type(type)
      "::Tandem::Content::#{type.to_s.camelize}"
    end

    def link_url
      "http://www.golfhooked.com/wpaethumbs/golf_ball.jpg"
    end

    def link_target
      "_blank"
    end

    def link?
      link_url.present?
    end
  end
end
