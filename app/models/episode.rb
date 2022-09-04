# frozen_string_literal: true

class Episode < ApplicationRecord
  include UuidIdentifiable

  belongs_to :show, optional: false

  has_one_attached :video

  def as_json(options = { skip_video: false })
    {
      identifier:,
      name:,
      season:,
      video_url:  options[:skip_video] ? nil : video.url
    }.compact
  end
end
