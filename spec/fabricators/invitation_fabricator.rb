# frozen_string_literal: true

Fabricator(:invitation) { user { Fabricate(:pending_user) } }
