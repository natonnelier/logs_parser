# frozen_string_literal: true

require_relative "exceptions"
require_relative "reader"

module Parser
  class Client
    attr_reader :file, :options, :data

    def self.parse(file, options = {})
      new(file, options).parse
    end

    def initialize(file, options = {})
      @file = file
      @options = options
    end

    def parse
      read_file
      print_data
    end

    private

    def read_file
      @data ||= ::Parser::Reader.new(file).call
    rescue InvalidExtensionException, FileNotFoundException => e
      abort e.message
    end

    def print_data
      ::Parser::Presenter.new(data, options).call
    end
  end
end
