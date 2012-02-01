# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_comment do
    link_id nil
    user_id nil
    comment "MyText"
  end
end
