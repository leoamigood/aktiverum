# frozen_string_literal: true

FactoryBot.define do
  factory :show do
    identifier { SecureRandom.uuid }
    name { FFaker::Lorem.phrase }
  end
end
