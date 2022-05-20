# frozen_string_literal: true

Fabricator(:profile) do
  given_name { Faker::Name.first_name }
  family_name { Faker::Name.last_name }
  email_address { Faker::Internet.email }
end
