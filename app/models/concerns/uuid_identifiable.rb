# frozen_string_literal: true

module UuidIdentifiable
  extend ActiveSupport::Concern

  included do
    attr_readonly :identifier
    validates :identifier, presence: true

    after_initialize ->(model) { model.identifier ||= SecureRandom.uuid }
  end
end
