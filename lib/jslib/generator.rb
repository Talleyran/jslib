#!/usr/bin/env ruby
module Jslib
  module Generator
    def self.run!
      CommandParser.new(Dir.pwd).generator.run!
    end
  end
end
