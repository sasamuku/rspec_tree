# frozen_string_literal: true

require "prism"
require "rspec_tree"

RSpec.describe RspecTree::Visitor do
  describe "#root" do
    subject do
      visitor = RspecTree::Visitor.new
      Prism.parse(code).value.accept(visitor)
      visitor.root
    end

    let(:code) do
      <<~RSPEC
        RSpec.describe Sample::SampleClass do
          describe "First describe" do
            context "First context" do
              it "should do something" do
                # Test code here
              end

              context "First nested context" do
                it "should do something" do
                  # Test code here
                end
              end
            end
          end

          describe "Second describe" do
            context "Second context" do
              it "should do something else" do
                # Test code here
              end
            end
          end
        end
      RSPEC
    end

    it "parses the root title correctly" do
      expect(subject.title).to eq(:SampleClass)
    end

    it "parses the top-level descriptions correctly" do
      expect(subject.descriptions.map(&:title)).to eq(["First describe", "Second describe"])
    end

    it "parses contexts and examples for the first description" do
      first_description = subject.descriptions.first
      expect(first_description.title).to eq("First describe")
      expect(first_description.contexts.map(&:title)).to eq(["First context"])

      first_context = first_description.contexts.first
      expect(first_context.title).to eq("First context")
      expect(first_context.examples.map(&:title)).to eq(["should do something"])

      nested_context = first_context.contexts.first
      expect(nested_context.title).to eq("First nested context")
      expect(nested_context.examples.map(&:title)).to eq(["should do something"])
    end

    it "parses contexts and examples for the second description" do
      second_description = subject.descriptions.last
      expect(second_description.title).to eq("Second describe")
      expect(second_description.contexts.map(&:title)).to eq(["Second context"])

      second_context = second_description.contexts.first
      expect(second_context.title).to eq("Second context")
      expect(second_context.examples.map(&:title)).to eq(["should do something else"])
    end
  end
end
