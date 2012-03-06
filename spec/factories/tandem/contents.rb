# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tandem_content do
    request_key 'tandem-pages-sample'
    tag "sample-tag"
    link_url "http://www.google.com"
    link_target "_blank"
  end
end
