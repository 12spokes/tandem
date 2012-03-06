# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :link_label do |n|
    "link label #{n}"
  end

  sequence :slug do |n|
    "slug_#{n}"
  end

  factory :tandem_page, :class => Tandem::Page do
    title "value for title"
    page_label "value for page label"
    link_label
    keywords "value for keywords"
    description "value for description"
    slug
    is_default false
  end
end
