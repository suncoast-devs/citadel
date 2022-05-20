# frozen_string_literal: true

class LayoutComponent < ViewComponent::Base
  def initialize(title: nil)
    super
    @title = title
  end

  def before_render
    @title = t("#{controller_name}.#{action_name}.title") if @title.blank?
  end
end
