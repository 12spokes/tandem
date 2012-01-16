module Tandem
  class Content::Image < Content
    #todo: the following line introduces an artifact field on the other types of Content. For now there is only one other field type, so this down and dirty association is quickest.
    #todo: I've already added a polymorphic field "attachment" that is designed for this same purpose, but is currently not being used for anything, it should be removed as well^^.
    belongs_to :image, class_name: 'Tandem::Image'

    validates :image_id, presence: true
  end
end
