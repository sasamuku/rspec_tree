# frozen_string_literal: true

module RspecTree
  class Description
    attr_accessor :title, :contexts

    def initialize
      @title = nil
      @contexts = []
    end
  end
end
