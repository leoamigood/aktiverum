# frozen_string_literal: true

module Api
  module V1
    class EpisodesController < BaseController
      include ActiveStorage::SetCurrent

      def show
        episode = Episode.find_by(identifier: params[:identifier])
        return head :not_found unless episode

        render json: episode
      end
    end
  end
end
