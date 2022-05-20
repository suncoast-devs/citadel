# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationComponent, type: :component do
  let(:component) { render_inline(described_class.new(type: :notice, data: 'Hello, world.')) }

  it 'renders the right icon' do
    expect(component).to have_css('.fa-circle-check')
  end

  it 'renders the data given as a string' do
    expect(component.css('h4')).to have_text('Hello, world.')
  end
end
