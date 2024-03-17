# frozen_string_literal: true

require "thor"
require "rspec_tree/tree"

module RspecTree
  # This class is used to define the CLI
  class CLI < Thor
    desc "all [file]", "Print all (describe, context, it, etc.)"
    def all(file)
      File.open(file, "r") do |f|
        Tree.all(f.read)
      end
    end

    desc "ctx [file]", "Print only describe and context"
    def ctx(file)
      File.open(file, "r") do |f|
        Tree.ctx(f.read)
      end
    end
  end
end
