# frozen_string_literal: true

module Parser
  class Presenter
    attr_accessor :data, :options

    def initialize(data, options = {})
      @data = data
      @options = options
    end

    def call
      output_formatted_data
    end

    private

    def format_class
      return Formats::Average if options[:average]
      return Formats::UniqueVisit if options[:unique]
      Formats::Visit
    end

    def output_formatted_data
      format_class.new(data).call
    end
  end
end
