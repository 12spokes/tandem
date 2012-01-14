# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tandem_content do
    association :page, :factory => :tandem_page
    #type "Tandem::Content"
    tag "sample_tag"
    link_url "http://www.google.com"
    link_target "_blank"
  end
end
