# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session Flow', type: :system do
  before { driven_by(:rack_test) }

  scenario 'User is redirected from dashboard when logged out' do
    visit '/'
    expect(page).to have_content('Authentication Required')
    expect(page).to have_no_content('Dashboard')
  end
end
