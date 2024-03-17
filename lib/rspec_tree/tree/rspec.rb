# frozen_string_literal: true

module RspecTree
  module Tree
    # This module is used to override the RSpec module
    module RSpec
      class << self
        def describe(*args, &block)
          puts "desc: #{args.first}"
          block.call
        end
      end
    end
  end
end
