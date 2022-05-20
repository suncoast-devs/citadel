# frozen_string_literal: true

class Authorization < ApplicationRecord
  belongs_to :user

  validates :uid, uniqueness: { scope: :provider }

  class << self
    def from_hash(auth)
      find_by(auth.slice(:provider, :uid))
    end
  end
end
