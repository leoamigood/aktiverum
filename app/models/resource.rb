# frozen_string_literal: true

class Resource < ApplicationRecord
  include UuidIdentifiable

  belongs_to :episode, optional: false
end
