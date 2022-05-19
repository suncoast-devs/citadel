# frozen_string_literal: true

class LayoutComponent < ViewComponent::Base
  def initialize(title: nil)
    super
    @title = title
  end

  def before_render
    @title = controller_name.humanize if @title.blank?
  end
end
