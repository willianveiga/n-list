# frozen_string_literal: true

require 'warden'
require 'omniauth'

OmniAuth.config.test_mode = true

RSpec.configure do |config|
  config.default_formatter = :doc

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.include Warden::Test::Helpers

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
