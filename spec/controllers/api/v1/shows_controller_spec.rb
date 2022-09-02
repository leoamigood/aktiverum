# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ShowsController, type: :controller do
  include ApiHelper

  let!(:user) { create(:user, :with_auth_token) }

  before do
    authenticated_header(request, user)
  end

  describe 'GET #index' do
    let!(:show) { create(:show) }

    it 'succeeds using JWT' do
      get :index

      expect(response).to have_http_status(:ok)
      expect(response.body).to include_json([{ identifier: show.identifier }])
    end

    it 'unauthorized' do
      request.headers['Authorization'] = 'Bearer bogus_token'

      get :index

      expect(response).to have_http_status(:unauthorized)
    end

    it 'succeeds with auth_token' do
      request.headers['Authorization'] = 'Bearer bogus_token'

      get :index, params: { auth_token: user.authentication_token }

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
