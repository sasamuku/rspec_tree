# frozen_string_literal: true

module RspecTree
  class Root
    attr_accessor :title, :descriptions

    def initialize
      @title = nil
      @descriptions = []
    end
  end
end
