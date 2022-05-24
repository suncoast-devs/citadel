# frozen_string_literal: true

module Citadel
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :tag, :capture, :concat, to: :@template

    def section(title = nil, &block)
      tag.div class: 'divide-y' do
        concat tag.h3 title, class: 'font-bold text-lg'
        concat capture(&block)
      end
    end

    def actions(&block)
      tag.div class: 'mt-2 border-t py-2 flex justify-end' do
        concat capture(&block)
      end
    end

    def text_field(attribute, options = {})
      label_text = options.fetch(:label, attribute.to_s.humanize)
      tag.div class: 'mt-2' do
        concat @template.label(@object_name, attribute, label_text, class: 'text-sm uppercase block text-slate-500')
        concat tag.div(class: 'mt-1') { super(attribute, options.reverse_merge(class: 'rounded block w-full')) }
      end
    end

    def submit(value = nil, options = {})
      super(value, options.reverse_merge(class: 'py-2 px-4 bg-indigo-600 text-white rounded'))
    end
  end
end
