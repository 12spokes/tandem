# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tandem_content do
    page_id 1
    type ""
    token "MyString"
    tag "MyString"
    content "MyText"
    bcontent ""
  end
end
