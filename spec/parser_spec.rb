# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Parser" do
  subject { Parser::Client }

  describe "parse when file is valid" do
    let(:file) { "spec/fixtures/files/valid_log.log" }

    context "without options" do
      let(:result) {
        "/some_page/1 5 visits\n/home 3 visits\n/other 2 visits\n/stuffs/2 2 visits\n/index 1 visits\n/stuffs 1 visits\n"
      }

      it "outputs sorted visits" do
        expect {
          subject.parse(file)
        }.to output(result).to_stdout
      end
    end

    context "with unique: true" do
      let(:options) { { unique: true } }
      let(:result) {
        "/some_page/1 5 unique views\n/home 3 unique views\n/other 1 unique views\n/stuffs/2 1 unique views\n/index 1 unique views\n/stuffs 1 unique views\n"
      }

      it "outputs sorted uniq results" do
        expect {
          subject.parse(file, options)
        }.to output(result).to_stdout
      end
    end
  end

  describe "parse when file is missing" do
    let(:file) { "missing.log" }
    let(:message) { "File not found" }

    it "aborts and shows File not found error message" do
      expect {
        subject.parse(file)
      }.to raise_error(SystemExit, "File not found")
    end
  end

  describe "parse when file extension is not valid" do
    let(:file) { "spec/fixtures/files/invalid_log.php" }

    it "aborts and shows Invalid extension error message" do
      expect {
        subject.parse(file)
      }.to raise_error(SystemExit, "File has to be .log or .txt")
    end
  end
end
