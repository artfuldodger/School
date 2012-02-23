FactoryGirl.define do
  factory :user do
    name 'User'
    email
    password 'boom'
    password_confirmation 'boom'
    is_admin false
  end
end