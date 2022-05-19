# frozen_string_literal: true

class User < ApplicationRecord
  has_many :authorizations, dependent: :destroy
  has_one :profile, dependent: :nullify

  scope :authorization,
        ->(param) {
          joins(:authorizations).where(
            ['authorizations.provider = ? and authorizations.uid = ?', param[:provider], param[:uid]],
          )
        }

  def add_provider(auth)
    # Check if the provider already exists, so we don't add it twice
    # unless authorizations.find_by_provider_and_uid(auth['provider'], auth['uid'])
    authorizations.create provider: auth[:provider], uid: auth[:uid]
    # end
  end
end
