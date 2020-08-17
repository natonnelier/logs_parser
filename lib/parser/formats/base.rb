# frozen_string_literal: true

module Formats
  class Base
    attr_reader :data

    def initialize(data)
      @data = data
    end

    private

    def sorted_data
      data.sort_by { |_, ips| -ips.size }
    end

    def output_data
      sorted_data.each do |path, ips|
        puts "#{path} #{ips.size} #{description}"
      end
    end
  end
end
