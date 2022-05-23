# frozen_string_literal: true

module ApplicationHelper
  def title(title)
    content_for :page_title, title
  end
end
