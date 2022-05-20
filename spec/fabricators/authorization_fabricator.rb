# frozen_string_literal: true

Fabricator(:authorization) do
  provider { OmniAuth.config.mock_auth.dig(:github, :provider) }
  uid { OmniAuth.config.mock_auth.dig(:github, :uid) }
end
