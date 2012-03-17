# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    store nil
    name "MyString"
    quantity 1
    weekly false
  end
end
