# frozen_string_literal: true

module RspecTree
  # This module is used to parse the RSpec file
  # and print the tree structure of the RSpec file.
  module Tree
    Class.class_eval do
      def const_missing(name)
        name.to_s
      end
    end

    # This class is used to override the RSpec module
    module RSpec
      class << self
        def describe(*args, &block)
          puts "desc: #{args.first}"
          block.call
        end
      end
    end

    class << self
      # @param [String] file
      # @param [Symbol] type
      def print(file, _type)
        eval(file) # rubocop:disable Security/Eval
      end

      private

      def describe(*args, &block)
        RSpec.describe(*args, &block)
      end

      def context(*args, &block)
        puts "├──ctx: #{args.first}"
        block.call
      end

      def example(*args, &_block)
        puts "├────ex: #{args.first}"
      end

      def it(*args, &_block)
        puts "├────it: #{args.first}"
      end

      def it_behaves_like(*args, &_block)
        puts "├────it_behaves_like: #{args.first}"
      end

      def require_relative(file); end

      def require(file); end

      def include(*args); end

      def method_missing(method, *args, &block); end

      def respond_to_missing?(method, *)
        super
      end
    end
  end
end
