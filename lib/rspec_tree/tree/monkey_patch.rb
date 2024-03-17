# frozen_string_literal: true

module RspecTree
  # This is a monkey patch to override basic behavior
  class Tree
    Class.class_eval do
      def const_missing(name)
        name.to_s
      end
    end

    private

    def require_relative(file); end

    def require(file); end

    def include(*args); end

    def method_missing(method, *args, &block); end

    def respond_to_missing?(method, *)
      super
    end
  end
end
