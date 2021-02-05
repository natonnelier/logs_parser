# frozen_string_literal: true
require_relative 'base'

module Formats
  class Average < Base
    def call
      output_data
    end

    private

    def output_data
      sorted_data.each do |path, ips|
        puts "#{path} average #{average(ips)}"
      end
    end

    def average(ips)
      ips.size.to_f / ips.uniq.size
    end
  end
end
