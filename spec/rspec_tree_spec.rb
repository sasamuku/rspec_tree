# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe RspecTree do
  let(:rspec_file) { File.read("spec/data/sample.rb") }

  describe "#print" do
    subject { RspecTree::Tree.new(rspec_file, type).print }

    context "when called with :all" do
      let(:type) { :all }

      it "prints all" do
        expect { subject }.to output(<<~OUTPUT).to_stdout
          desc: Sample
          desc: First describe
          ├─────ctx: First context
          ├───────it: should do something
          ├───────ctx: First nested context
          ├─────────it: should do something
          ├───────it_behaves_like: shared example
          desc: Second describe
          ├─────ctx: Second context
          ├───────it: should do something else
        OUTPUT
      end
    end

    context "when called with :ctx" do
      let(:type) { :ctx }

      it "prints only describe and context" do
        expect { subject }.to output(<<~OUTPUT).to_stdout
          desc: Sample
          desc: First describe
          ├─────ctx: First context
          ├───────ctx: First nested context
          desc: Second describe
          ├─────ctx: Second context
        OUTPUT
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
