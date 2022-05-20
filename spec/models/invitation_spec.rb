require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it 'generates a unique token' do
    a = Invitation.new
    b = Invitation.new

    expect(a.token).not_to eq(b.token)
  end
end
