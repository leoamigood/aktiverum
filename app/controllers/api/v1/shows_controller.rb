# frozen_string_literal: true

module Api
  module V1
    class ShowsController < BaseController
      def index
        render json: Show.all
      end

      def show
        the_show = Show.find_by(identifier: params[:identifier])
        return head :not_found unless the_show

        render json: the_show
      end
    end
  end
end
