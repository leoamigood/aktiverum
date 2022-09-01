# frozen_string_literal: true

module Api
  module V1
    class ShowsController < ApplicationController
      def index
        render json: Show.all
      end

      def show
        the_show = Show.find_by!(identifier: params[:identifier])
        render json: the_show
      end
    end
  end
end
