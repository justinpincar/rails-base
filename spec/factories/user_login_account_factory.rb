FactoryGirl.define do
  factory :user_login_account, :class => User::LoginAccount do |ula|
    sequence(:remote_account_id) { |n| "#{n}" }
    sequence(:access_token) { |n| "abc#{n}" }
    access_token_secret "password"
    name "user"
    sequence(:email) { |n| "user#{n}@domain.test" }
  end
end
