# frozen_string_literal: true

Rails
  .application
  .routes
  .draw do
    namespace :api do
      get 'health', to: 'health#index'
    end

    # Authentication
    resource :session, only: %i[new create destroy]
    get 'auth/failure', to: redirect('/')
    match 'auth/:provider/callback', to: 'sessions#create', via: %i[get post]

    root 'dashboard#index'
  end
