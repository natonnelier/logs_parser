# frozen_string_literal: true

require "spec_helper"

RSpec.describe Formats::Average do
  let(:data) {
    {
      "/some_path" => %w[ip1 ip1 ip2 ip3],
      "/other_path" => %w[ip4 ip4 ip3]
    }
  }
  subject { described_class.new(data) }

  describe "#call" do
    let(:average1) { 4/3 }
    let(:average2) { 3/2 }
    let(:formatted_data) { "/some_path average #{average1}\n/other_path average #{average2}\n" }

    it "shows results with proper description" do
      expect { subject.call }.to output(formatted_data).to_stdout
    end
  end
end
