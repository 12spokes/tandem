# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tandem_content_image, :class => Tandem::Content::Image, :parent => :tandem_content do
    #type "Tandem::Content::Image"
    image
  end
end
