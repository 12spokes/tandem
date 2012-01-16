# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tandem_content_image, :class => Tandem::Content::Image, :parent => :tandem_content do
    association :image, :factory => :tandem_image
  end
end
