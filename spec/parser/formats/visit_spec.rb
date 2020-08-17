# frozen_string_literal: true

require "spec_helper"

RSpec.describe Formats::Visit do
  let(:data) {
    {
      "/some_path" => %w[ip1 ip1 ip2 ip3],
      "/other_path" => %w[ip4 ip4]
    }
  }
  subject { described_class.new(data) }

  describe "#call" do
    let(:formatted_data) { "/some_path 4 visits\n/other_path 2 visits\n" }

    it "shows results with proper description" do
      expect { subject.call }.to output(formatted_data).to_stdout
    end
  end
end
