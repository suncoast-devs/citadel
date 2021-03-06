# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Rails.application.credentials.google_client_id,
           Rails.application.credentials.google_client_secret

  provider :github,
           Rails.application.credentials.github_client_id,
           Rails.application.credentials.github_client_secret,
           scope: 'user:email,public_repo'
end
