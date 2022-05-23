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

    get 'invite/:token', to: 'home#invite', as: :invite
    get 'dash', to: 'dashboard#index', as: :dashboard

    root 'home#index'
  end
