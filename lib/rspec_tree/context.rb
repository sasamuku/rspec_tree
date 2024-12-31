# frozen_string_literal: true

module RspecTree
  class Context
    attr_accessor :title, :contexts, :examples

    def initialize
      @title = nil
      @contexts = []
      @examples = []
    end
  end
end
