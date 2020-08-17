# frozen_string_literal: true

require "spec_helper"

RSpec.describe Parser::Client do
  subject { described_class.parse(file, options) }

  describe "#parse" do
    context "when file is valid" do
      let(:file) { "spec/fixtures/files/valid_log.log" }
      let(:reader) { double(:reader) }
      let(:data) { double(:data) }
      let(:presenter) { double(:presenter) }

      before do
        allow(::Parser::Reader).to receive(:new).with(file) { reader }
        allow(reader).to receive(:call) { data }
        allow(::Parser::Presenter).to receive(:new).with(data, options) { presenter }
        allow(presenter).to receive(:call)
        subject
      end

      context "and no options are passed" do
        let(:options) { {} }

        it "calls presenter with empty hash" do
          expect(::Parser::Presenter).to have_received(:new).with(data, options)
        end
      end

      context "and options[:unique] is set" do
        let(:options) { { unique: true } }

        it "calls presenter with unique flag" do
          expect(::Parser::Presenter).to have_received(:new).with(data, options)
        end
      end
    end
  end
end
