# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ShowsController, type: :controller do
  describe 'GET #index' do
    let!(:show) { create(:show) }

    it 'succeeds' do
      get :index

      expect(response).to have_http_status(:ok)
      expect(response.body).to include_json([{ identifier: show.identifier }])
    end
  end

  describe 'GET #show' do
    let(:show) { create(:show) }

    it 'succeeds' do
      get :show, params: { identifier: show.identifier }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include_json({ identifier: show.identifier })
    end

    it 'not found' do
      get :show, params: { identifier: 'invalid_identifier' }

      expect(response).to have_http_status(:not_found)
      expect(response.body).to be_empty
    end
  end
end
