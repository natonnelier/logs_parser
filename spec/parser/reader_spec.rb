# frozen_string_literal: true

require "spec_helper"

RSpec.describe Parser::Reader do
  subject { described_class.new(file) }

  describe "#call" do
    context "when file is missing" do
      let(:file) { "missing_file" }

      it "raises FileNotFoundException error" do
        expect { subject.call }.to raise_error(Parser::FileNotFoundException, "File not found")
      end
    end

    context "when file has invalid extension" do
      let(:file) { "spec/fixtures/files/invalid_log.php" }

      it "raises InvalidExtensionException error" do
        expect { subject.call }.to raise_error(Parser::InvalidExtensionException, "File has to be .log or .txt")
      end
    end

    context "when file is valid" do
      let(:file) { "spec/fixtures/files/valid_log.log" }
      let(:data) { subject.call }

      it "reads file and returns hash" do
        expect(data).to be_a(Hash)
      end

      it "returned hash keys are uri paths" do
        expect(data.keys.all? { |key| key.match?(%r{\/[\S]+}) }).to be_truthy
      end

      it "returned hash key => values are arrays of ips" do
        expect(
          data.keys.all? { |key| data[key].is_a?(Array) && !data[key].empty? }
        ).to be_truthy
      end
    end
  end
end
