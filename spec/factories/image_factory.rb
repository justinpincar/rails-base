include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do |item|
    file { fixture_file_upload("#{Rails.root}/spec/fixtures/images/rails.png", 'image/png') }
    user { create(:user) }
  end

  factory :default_avatar, :class => Image do |item|
    file { fixture_file_upload("#{Rails.root}/app/assets/images/avatar.png", 'image/png') }
    meta_data { "default_avatar" }
  end
end

