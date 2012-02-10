module Jslib
  class CommandParser
    attr_reader :generator
    def initialize dir
      require 'optparse'
      options = {}
      OptionParser.new do |opts|
        if ARGV[0] =~ /^n+/
          options[:project_name] = ARGV[1]
          options[:sxss] = 'sass'
          opts.on('--css [PARTIAL]', ['sass','scss'], "Select extension of CSS (sass (default), scss)") do |v|
            options[:sxss] = v
          end
          #...
          opts.on_tail do
            @generator = Generator::Project.new dir, options
          end
        elsif ARGV[0] =~ /^p+/
          opts.on('-n', '--name [PARTIAL]', Template::list, "Select partial (#{Template::list.join(', ')})") do |v|
            options[:name] = v
          end
          #...
          opts.on_tail do
            @generator = Generator::Partial.new dir, options
          end
        elsif ARGV[0] =~ /^d+/
          #...
          opts.on_tail do
            @generator = Generator::Downloader.new dir, options
          end
        end
      end.parse!
    end
  end
end
