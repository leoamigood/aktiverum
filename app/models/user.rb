# frozen_string_literal: true

class User < ApplicationRecord
  include UuidIdentifiable

  devise :database_authenticatable, :token_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # TODO: implement JTIMatcher (or similar) revocation strategy instead
  def self.jwt_revoked?(_token, _payload)
    false
  end
end
