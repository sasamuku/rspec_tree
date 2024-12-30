# frozen_string_literal: true

require "prism"

require_relative "root"
require_relative "description"
require_relative "context"
require_relative "example"

module RspecTree
  class Visitor < Prism::Visitor
    attr_accessor :root

    def initialize
      @root = RspecTree::Root.new
      super
    end

    def call_node?(node)
      node.is_a?(Prism::CallNode)
    end

    def block_node?(node)
      node.is_a?(Prism::BlockNode)
    end

    def root_describe_node?(node)
      node&.name == :describe && node.receiver
    end

    def describe_node?(node)
      node.name == :describe
    end

    def context_node?(node)
      node.name == :context
    end

    def example_node?(node)
      node.name == :it || node.name == :specify || node.name == :example
    end

    def handle_root_describe_node(node)
      @root.title = node.arguments.arguments.first.name
      call_nodes_in_block(node).each do |child_node|
        if describe_node?(child_node)
          @root.descriptions << RspecTree::Description.new
          handle_describe_node(child_node, @root.descriptions.last)
        end
      end
    end

    def handle_describe_node(node, parent)
      parent.title = node.arguments.arguments.first.unescaped
      call_nodes_in_block(node).each do |child_node|
        if context_node?(child_node)
          parent.contexts << RspecTree::Context.new
          handle_context_node(child_node, parent.contexts.last)
        end
      end
    end

    def handle_context_node(node, parent)
      parent.title = node.arguments.arguments.first.unescaped
      call_nodes_in_block(node).each do |child_node|
        if context_node?(child_node)
          parent.contexts << RspecTree::Context.new
          handle_context_node(child_node, parent.contexts.last)
        elsif example_node?(child_node)
          parent.examples << RspecTree::Example.new
          handle_example_node(child_node, parent.examples.last)
        end
      end
    end

    def handle_example_node(node, parent)
      parent.title = node.arguments.arguments.first.unescaped
    end

    def call_nodes_in_block(node)
      call_nodes = []
      node.compact_child_nodes.each do |child_node|
        if block_node?(child_node)
          call_nodes = child_node.compact_child_nodes.first.compact_child_nodes.select do |child_node|
            call_node?(child_node)
          end
        end
      end
      call_nodes
    end

    def visit_call_node(node)
      if root_describe_node?(node)
        handle_root_describe_node(node)
      elsif describe_node?(node)
        handle_describe_node(node)
      elsif context_node?(node)
        handle_context_node(node)
      elsif example_node?(node)
        handle_example_node(node)
      end
    end
  end
end
