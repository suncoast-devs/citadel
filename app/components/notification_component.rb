# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  def initialize(type:, data:)
    super
    @type = type.to_sym
    @data = prepare_data(data)
  end

  def title
    @data[:title] || 'What'
  end

  def body
    @data[:body]
  end

  def bg_color_class
    case @type
    when :notice
      'bg-green-200'
    when 'alert'
      'bg-red-200'
    else
      'bg-yellow-200'
    end
  end

  def text_color_class
    case @type
    when :notice
      'text-green-800'
    when :alert
      'text-red-800'
    else
      'text-yellow-800'
    end
  end

  def icon_class
    case @type
    when :notice
      'fa-circle-check'
    when :alert
      'fa-circle-radiation'
    else
      'fa-okay'
    end
  end

  def icon_size_class
    body.present? ? 'fa-2x' : nil
  end

  private

  def prepare_data(data)
    case data
    when Hash
      data.symbolize_keys
    else
      { title: data }
    end
  end
end
