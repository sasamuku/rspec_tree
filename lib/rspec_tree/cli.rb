# frozen_string_literal: true

require "thor"
require "rspec_tree/tree"

module RspecTree
  # This class is used to define the CLI
  class CLI < Thor
    desc "all [file]", "Print all (describe, context, it, etc.)"
    def all(file)
      File.open(file, "r") do |f|
        Tree.new(f.read, :all).print
      end
    end

    desc "ctx [file]", "Print only describe and context"
    def ctx(file)
      File.open(file, "r") do |f|
        Tree.new(f.read, :ctx).print
      end
    end
  end
end
