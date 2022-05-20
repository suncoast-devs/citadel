# frozen_string_literal: true

class Profile < ApplicationRecord
  has_one :user, dependent: :restrict_with_error
end
