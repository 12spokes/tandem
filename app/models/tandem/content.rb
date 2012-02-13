module Tandem
  class Content < ActiveRecord::Base
    belongs_to :page

    validates :tag, presence: true
    validates :page_id, presence: true, uniqueness: {:scope => [:tag, :type]}

    #enforce abstract class architecture
    validates :type, presence: true, exclusion: ['Tandem::Content']

    def self.subclass_names
      @subclass_names ||= subclasses.map { |sc| sc.name }
    end

    def self.simple_types
      @simple_types ||= subclasses.map { |sc| sc.simple_type }
    end

    def self.valid_simple_type?(type)
      simple_types.include?(type.to_s.downcase.to_sym)
    end

    def self.simple_type
      name =~ /^Tandem\:\:Content\:\:(.*)/
      ($1 or raise "Unable to determine simple type for abstract class: #{name}").downcase.to_sym
    end

    def self.scoped_type(type)
      valid_simple_type?(type) or raise "Invalid Tandem::Content.simple_type: '#{type}'. Valid options #{simple_types.join(', ')}"
      "Tandem::Content::#{type.to_s.camelize}"
    end

    def link?
      link_url.present?
    end
  end
end

load 'image.rb'
load 'text.rb'
