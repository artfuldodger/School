FactoryGirl.define do
  factory :user do
    name 'User'
    email 
    association :role
    password 'boom'
    password_confirmation 'boom'
  end
end