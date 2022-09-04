# frozen_string_literal: true

class Show < ApplicationRecord
  include UuidIdentifiable

  has_many :episodes, dependent: :destroy

  def as_json(options = { skip_video: true })
    {
      identifier:,
      name:,
      episodes:   episodes.map { |e| e.as_json(options) }
    }
  end
end
