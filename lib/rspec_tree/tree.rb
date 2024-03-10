# frozen_string_literal: true

module RspecTree
  module Tree
    Class.class_eval do
      def const_missing(name)
        name.to_s
      end
    end

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
      def all(file)
        eval(file)
      end

      # TODO: to be implemented
      def ctx(file)
        eval(file)
      end

      private

      def describe(*args, &block)
        RSpec.describe(*args, &block)
      end

      def context(*args, &block)
        puts "├──ctx: #{args.first}"
        block.call
      end

      def example(*args, &block)
        puts "├────ex: #{args.first}"
      end

      def it(*args, &block)
        puts "├────it: #{args.first}"
      end

      def it_behaves_like(*args, &block)
        puts "├────it_behaves_like: #{args.first}"
      end

      def require_relative(file); end

      def require(file); end

      def include(*args); end

      def method_missing(method, *args, &block); end
    end
  end
end
