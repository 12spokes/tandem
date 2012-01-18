# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tandem_content_text, :class => Tandem::Content::Text, :parent => :tandem_content do
    content "<p>Sample Paragraph</p>"
  end
end
