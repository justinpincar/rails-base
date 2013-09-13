FactoryGirl.define do
  factory :admin_authorization, :class => 'Authorization' do |authorization|
    association :user
    role Role.admin
  end
end

