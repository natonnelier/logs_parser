# frozen_string_literal: true

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task default: %w[lint spec]
rescue LoadError
  # no rspec available
end
