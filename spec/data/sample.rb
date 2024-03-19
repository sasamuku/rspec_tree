# frozen_string_literal: true

# This file is sample RSpec for test.

require "sample"
require_relative "sample/example"

RSpec.describe Sample::SampleClass do # rubocop:disable Metrics/BlockLength
  include ExampleModule
  include Example::SampleModule

  let(:foo) { "foo" }

  before do
    # Setup code here
  end

  describe "First describe" do
    let(:bar) { "bar" }

    context "First context" do
      let(:baz) { "baz" }

      it "should do something" do
        # Test code here
      end

      context "First nested context" do
        it "should do something" do
          # Test code here
        end
      end

      it_behaves_like "shared example"
    end
  end

  describe "Second describe" do
    let(:qux) { "qux" }

    context "Second context" do
      it "should do something else" do
        # Test code here
      end
    end
  end

  shared_examples "shared example" do
    it "should behave in a certain way" do
      # Test code here
    end
  end
end
