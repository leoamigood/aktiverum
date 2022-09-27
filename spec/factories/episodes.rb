# frozen_string_literal: true

FactoryBot.define do
  factory :episode do
    identifier { SecureRandom.uuid }
    name { FFaker::Lorem.phrase }
    season { "S#{FFaker::Number.number(digits: 1)}" }

    video { Rack::Test::UploadedFile.new("Gemfile", "video/mp4") }
  end
end
