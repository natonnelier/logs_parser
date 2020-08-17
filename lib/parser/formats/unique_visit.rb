# frozen_string_literal: true

module Formats
  class UniqueVisit < Base
    def call
      ips_uniq!
      output_data
    end

    private

    def ips_uniq!
      data.each { |_, ips| ips.uniq! }
    end

    def description
      "unique views"
    end
  end
end
