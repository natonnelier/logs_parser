# frozen_string_literal: true

module Parser
  class Reader
    VALID_EXTENSIONS = %w[.log .txt].freeze

    attr_accessor :file

    def initialize(file)
      @file = file
    end

    def call
      validate_presence
      validate_extension
      aggregate
    end

    private

    def validate_extension
      unless VALID_EXTENSIONS.include? File.extname(file)
        raise InvalidExtensionException, "File has to be .log or .txt"
      end
    end

    def validate_presence
      raise FileNotFoundException, "File not found" unless file && File.exist?(file)
    end

    def file_lines
      @file_lines ||= File.readlines file
    end

    def aggregate
      data = Hash.new { |h, key| h[key] = [] }
      file_lines.each do |line|
        path, ip = line.split
        data[path] << ip
      end
      data
    end
  end
end
