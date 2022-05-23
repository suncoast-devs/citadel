# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

profile = Profile.create(given_name: 'Jason', family_name: 'Perry', email_address: 'jason@suncoast.io')
user = profile.create_user(role: :admin)
user.create_invitation
