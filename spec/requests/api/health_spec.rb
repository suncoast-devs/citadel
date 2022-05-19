# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Health API' do
  describe 'GET /api/health' do
    it 'returns http success' do
      get '/api/health'
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json['uptime']).to be > 0
    end
  end
end
