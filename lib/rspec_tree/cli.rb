# frozen_string_literal: true

require "thor"
require "rspec_tree/tree"
require "rspec_tree/visitor"

module RspecTree
  # This class is used to define the CLI
  class CLI < Thor
    desc "all [file]", "Print all (describe, context, it, etc.)"
    def all(file)
      File.open(file, "r") do |f|
        visitor = RspecTree::Visitor.new
        Prism.parse(f.read).value.accept(visitor)
        RspecTree::Tree.new(visitor.root, :all).print
      end
    end

    desc "ctx [file]", "Print only describe and context"
    def ctx(file)
      File.open(file, "r") do |f|
        visitor = RspecTree::Visitor.new
        Prism.parse(f.read).value.accept(visitor)
        RspecTree::Tree.new(visitor.root, :ctx).print
      end
    end
  end
end
