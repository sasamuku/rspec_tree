# frozen_string_literal: true

RSpec.describe RspecTree do
  let(:rspec_file) { File.read("spec/data/sample.rb") }

  describe ".all" do
    subject { RspecTree::Tree.new(rspec_file, :all).print }

    it "prints all (describe, context, it, etc.)" do
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
end
