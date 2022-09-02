# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API
      before_action :authenticate_user!

      private

      def not_found_error(msg, code = nil)
        json_error(msg, :not_found, code)
      end

      def unprocessable_entity_error(msg)
        json_error(msg, :unprocessable_entity)
      end

      def json_error(msg, status, code = nil)
        render json: { errors: [msg], code: code || status }, status:
      end
    end
  end
end
