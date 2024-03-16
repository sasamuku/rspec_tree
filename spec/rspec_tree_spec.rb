# frozen_string_literal: true

RSpec.describe RspecTree do

  context "when the version is 0.1.0" do
    it "has a version number" do
      expect(RspecTree::VERSION).not_to be nil
    end

    it "does something useful" do
      expect(false).to eq(true)
    end
  end

  context "when the version is 0.1.1" do
    it "has a version number" do
      expect(RspecTree::VERSION).not_to be nil
    end

    it "does something useful" do
      expect(false).to eq(true)
    end
  end
end
