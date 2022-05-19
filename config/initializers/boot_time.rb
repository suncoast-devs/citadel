# frozen_string_literal: true

Rails.application.config.after_initialize { Citadel::BOOTED_AT = Time.current }
