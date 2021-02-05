# frozen_string_literal: true

namespace :parse do |args|
  options = {}
  file = ARGV[1]

  task :visits do
    Parser::Client.parse(file)
  end

  task :unique do
    options[:unique] = true
    Parser::Client.parse(file, options)
  end

  task :average do
    options[:average] = true
    Parser::Client.parse(file, options)
  end
end
