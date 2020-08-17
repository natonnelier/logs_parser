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
      options[:unique] ? Formats::UniqueVisit : Formats::Visit
    end

    def output_formatted_data
      format_class.new(data).call
    end
  end
end
