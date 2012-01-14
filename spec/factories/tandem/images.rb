# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tandem_image, :class => Tandem::Image do
    resource File.new(ENGINE_RAILS_ROOT + 'spec/fixtures/tandem/images/test.jpg')
  end
end
