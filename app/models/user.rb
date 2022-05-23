# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :profile
  has_many :authorizations, dependent: :destroy
  has_one :invitation, dependent: :destroy

  enum status: { disabled: -1, pending: 0, active: 1 }
  enum role: { user: 0, admin: 1 }
end
