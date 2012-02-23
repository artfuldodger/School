# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    question nil
    user nil
    detail "MyText"
  end
end
