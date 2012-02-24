# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    user
    category
    title "MyString"
    detail "MyText"
  end
end
