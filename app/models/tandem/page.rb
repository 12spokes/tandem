module Tandem
  class Page < ActiveRecord::Base
    has_many :contents
    belongs_to :parent, :class_name => 'Page'

    validates :link_label, presence: true, uniqueness: true
    validates :slug, presence: true, uniqueness: true
    validates :is_default, :inclusion => {:in => [true, false]}

    before_validation :do_before_validation
    after_save :do_after_save

    def initialize(attributes = {})
      super
      self.template ||= 'page'
    end

    def to_param
      persisted? ? slug : nil
    end

    private

    #auto increment slug until it is unique
    def do_before_validation
      prim_slug, i = slug, 0
      prim_slug, i = $1, $2.to_i if slug =~ /^(.*)_([0-9]+)$/

      return unless prim_slug.present?

      attempts = 0
      conditions = new_record? ? ['slug = ?',slug] : ['slug = ? AND id != ?',slug,id]
      conditions[1] = "#{prim_slug}_#{i+=1}" while Page.where(conditions).first && (attempts += 1) < 20
      write_attribute(:slug,conditions[1])
    end

    def do_after_save
      self.class.update_all({is_default: false}, ['id != ?',id]) if is_default?
    end
  end
end
