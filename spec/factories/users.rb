# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.unique.email }
    username { FFaker::Internet.unique.user_name }
  end

  trait :with_auth_token do
    authentication_token { Devise.friendly_token }
  end
end
