module Tandem
  class Content::Image < Content
    #todo: the following line introduces an artifact field on the other types of Content. For now there is only one other field type, so this down and dirty association is quickest.
    belongs_to :image, class_name: 'Tandem::Image'
  end
end
