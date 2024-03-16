require "thor"
require "rspec_tree/tree"

module RspecTree
  class CLI < Thor
    desc "all", "Print all"
    def all(file)
      File.open(file, "r") do |f|
        Tree.all(f.read)
      end
    end

    desc "ctx", "Print describe and context"
    def ctx(file)
      File.open(file, "r") do |f|
        Tree.ctx(f.read)
      end
    end
  end
end
