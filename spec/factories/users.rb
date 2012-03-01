FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
  
  factory :user do
    email FactoryGirl.generate :email
    password "secretSanta23$"
    password_confirmation "secretSanta23$"
  end
end
