# frozen_string_literal: true

module Formats
  class Visit < Base
    def call
      output_data
    end

    private

    def description
      "visits"
    end
  end
end
