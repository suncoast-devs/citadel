# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session Flow', type: :system do
  before do
    driven_by(:rack_test)
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  scenario 'User is redirected from dashboard when signed out' do
    visit dashboard_path
    expect(page).to have_content('Authentication Required')
    expect(page).to have_no_content('Dashboard')
  end

  scenario 'User is directed to dashboard when signed in' do
    Fabricate(:user)

    visit new_session_path
    click_on 'Sign in with GitHub'
    expect(page).to have_content('Dashboard')
  end

  scenario 'Uninvited user is not allowed to sign in' do
    visit new_session_path
    click_on 'Sign in with GitHub'
    expect(page).to have_content('Authentication Failed')
    expect(page).to have_no_content('Dashboard')
  end

  scenario 'Invited user can redeem invitation' do
    invitation = Fabricate(:invitation)
    expect(invitation.user).to be_pending
    expect(invitation.user.authorizations).to be_empty
    visit invite_path(invitation.token)
    click_on 'Sign in with GitHub'
    expect(page).to have_content('Dashboard')

    invitation.reload
    expect(invitation.user.authorizations).not_to be_empty
    expect(invitation.user).to be_active
    expect(invitation).to be_redeemed
  end
end
