# frozen_string_literal: true

module RspecTree
  class Tree
    def initialize(root, type)
      @root = root
      @type = type
    end

    def print
      print_root_description(@root, 0)
    end

    private

    def print_root_description(description, depth)
      puts "desc: #{description.title}"

      description.descriptions.each do |nested_description|
        print_description(nested_description, depth + 1)
      end
    end

    def print_description(description, depth)
      puts "#{indent(depth)}desc: #{description.title}"

      description.contexts.each do |context|
        print_context(context, depth + 1)
      end
    end

    def print_context(context, depth)
      puts "#{indent(depth)}ctx: #{context.title}"

      context.contexts.each do |ctx|
        print_context(ctx, depth + 1)
      end

      context.examples.each do |example|
        print_example(example, depth + 1)
      end
    end

    def print_example(example, depth)
      return if @type == :ctx

      puts "#{indent(depth)}it: #{example.title}"
    end

    def indent(level)
      "\u251C#{"\u2500\u2500" * level}"
    end
  end
end
