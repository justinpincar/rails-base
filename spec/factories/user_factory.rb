FactoryGirl.define do
  factory :user do |user|
    sequence(:email) { |n| "user#{n}@domain.test" }
    sequence(:name) { |n| "user#{n}" }
    password "password"
    password_confirmation "password"

    trait :admin do
      after :create do |u|
        create(:admin_authorization, :user => u)
      end
    end
    factory :admin_user, :traits => [:admin]

    trait :with_image do
      after(:create) do |instance|
        instance.update_attribute(:image, create(:image, :imageable => instance))
      end
    end
  end
end

