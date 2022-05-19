# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2,
           Rails.application.credentials.google_client_id,
           Rails.application.credentials.google_client_secret,
           hd: 'suncoast.io'
  provider :github,
           Rails.application.credentials.github_app_id,
           Rails.application.credentials.github_app_secret,
           scope: 'user:email,public_repo'
end
