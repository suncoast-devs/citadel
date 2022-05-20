# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :user

  after_initialize :generate_token, if: :new_record?

  def generate_token
    self.token = SecureRandom.hex(8)
  end
end
