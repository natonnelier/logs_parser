# frozen_string_literal: true

begin
  Dir["lib/**/*.rb"].each { |f| require_relative(f) }
  Dir["lib/tasks/*.rake"].each { |f| load(f) }
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)

  task default: %w[lint spec]
rescue LoadError
  # no rspec available
end
