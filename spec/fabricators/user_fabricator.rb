# frozen_string_literal: true

Fabricator(:user) do
  profile
  status :active
  role :user
  authorizations(count: 1)
end

Fabricator(:pending_user, from: 'User') do
  profile
  status :pending
  role :user
end
