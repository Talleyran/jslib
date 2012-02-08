module Jslib
  class CommandParser
    def initialize
      require 'optparse'
      options = {}
      OptionParser.new do |opts|
        opts.on('-n', '--new [project]') do |v|
          options[:new] = v
        end
        opts.on('-t', '--template [template]') do |v|
          options[:template] = [v]
        end
        opts.on('-t', '--template [template]') do |v|
          options[:template] = [v]
          opts.on('--name [name]') do |vv|
            options[:template_name] = [vv]
          end
        end
      end.parse!
      p options
    end
  end
end
