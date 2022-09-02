# frozen_string_literal: true

class Show < ApplicationRecord
  include UuidIdentifiable

  has_many :episodes, dependent: :destroy

  def as_json(_ = {})
    {
      identifier:,
      name:
    }
  end
end
