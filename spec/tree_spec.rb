# frozen_string_literal: true

require "prism"
require "rspec_tree"

RSpec.describe RspecTree::Tree do
  describe "#print" do
    subject do
      visitor = RspecTree::Visitor.new
      Prism.parse(code).value.accept(visitor)
      RspecTree::Tree.new(visitor.root, type).print
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

    context "when called with :all" do
      let(:type) { :all }

      it "prints all" do
        expect { subject }.to output(<<~OUTPUT).to_stdout
          desc: SampleClass
          ├──desc: First describe
          ├────ctx: First context
          ├──────ctx: First nested context
          ├────────it: should do something
          ├──────it: should do something
          ├──desc: Second describe
          ├────ctx: Second context
          ├──────it: should do something else
        OUTPUT
      end
    end

    context "when called with :ctx" do
      let(:type) { :ctx }

      it "prints only describe and context" do
        expect { subject }.to output(<<~OUTPUT).to_stdout
          desc: SampleClass
          ├──desc: First describe
          ├────ctx: First context
          ├──────ctx: First nested context
          ├──desc: Second describe
          ├────ctx: Second context
        OUTPUT
      end
    end
  end
end
