# frozen_string_literal: true

require "spec_helper"

RSpec.describe Parser::Presenter do
  subject { described_class.new(data, options) }

  describe "#call" do
    let(:data) { { "/some_page" => %w[ip1 ip2 ip3] } }

    before { allow(format_class).to receive(:call) }

    context "when options[:unique] is true" do
      let(:options) { { unique: true } }
      let(:format_class) { double(:unique_visit_format) }

      before do
        allow(Formats::UniqueVisit).to receive(:new).with(data) { format_class }
        subject.call
      end

      it "triggers UniqueVisit class call method" do
        expect(format_class).to have_received(:call)
      end
    end

    context "when options[:unique] is nil" do
      let(:options) { {} }
      let(:format_class) { double(:visit_format) }

      before do
        allow(Formats::Visit).to receive(:new).with(data) { format_class }
        subject.call
      end

      it "triggers UniqueVisit class call method" do
        expect(format_class).to have_received(:call)
      end
    end
  end
end
