# frozen_string_literal: true

class Episode < ApplicationRecord
  include UuidIdentifiable

  belongs_to :show, optional: false

  has_one_attached :video

  def as_json(_ = {})
    {
      identifier:,
      name:,
      season:,
      video:      video.url
    }
  end
end
