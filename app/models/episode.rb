# frozen_string_literal: true

class Episode < ApplicationRecord
  include UuidIdentifiable

  belongs_to :show, optional: false
end
