# frozen_string_literal: true

Fabricator(:user) do
  profile
  authorizations(count: 1)
  role :user
  status :active
end
