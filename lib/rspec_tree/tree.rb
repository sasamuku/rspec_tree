# frozen_string_literal: true

require_relative "tree/rspec"
require_relative "tree/monkey_patch"

module RspecTree
  # This module is used to parse the RSpec file
  # and print the tree structure of the RSpec file.
  class Tree
    attr_reader :file, :type
    attr_accessor :base_depth

    def initialize(file, type)
      @file = file
      @type = type
      @base_depth = 0
    end

    def print
      eval(file) # rubocop:disable Security/Eval
    end

    private

    def describe(*args, &block)
      self.base_depth = caller.size
      RSpec.describe(*args, &block)
    end

    def context(*args, &block)
      tree(args.first, "ctx")
      block.call
    end

    def example(*args, &_block)
      tree(args.first, "ex")
    end

    def it(*args, &_block)
      tree(args.first, "it") if type == :all
    end

    def it_behaves_like(*args, &_block)
      tree(args.first, "it_behaves_like") if type == :all
    end

    def dash
      "─" * (caller.size - base_depth)
    end

    def tree(arg, name)
      puts "├#{dash}#{name}: #{arg}"
    end
  end
end
