# frozen_string_literal: true

module API
  class HealthController < ApplicationController
    def index
      render json: { uptime: Time.current - Citadel::BOOTED_AT }, status: :ok
    end
  end
end
