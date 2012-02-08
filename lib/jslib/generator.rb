#!/usr/bin/env ruby
require 'git'
require 'jslib'

Git.init File.join(Dir.pwd, ARGV[0])

#lib

Dir.mkdir File.join(Dir.pwd, ARGV[0],'lib')
Dir.mkdir File.join(Dir.pwd, ARGV[0],'lib', 'coffee-scripts')
sxss = ARGV[1]
Dir.mkdir File.join(Dir.pwd, ARGV[0],'lib', "#{sxss}")


#public

Dir.mkdir File.join(Dir.pwd, ARGV[0],'public')
Dir.mkdir File.join(Dir.pwd, ARGV[0],'public','javascripts')
Dir.mkdir File.join(Dir.pwd, ARGV[0],'public','stylesheets')
Dir.mkdir File.join(Dir.pwd, ARGV[0],'public','images')
File.open File.join(Dir.pwd, ARGV[0],'Gemfile'), 'w+' do |f|
  f.puts Jslib::utils_gemfile_erb
end


#other

Dir.mkdir File.join(Dir.pwd, ARGV[0],'utils')
Dir.mkdir File.join(Dir.pwd, ARGV[0],'examples')

File.new File.join(Dir.pwd, ARGV[0],'README'), 'w+'
File.open File.join(Dir.pwd, ARGV[0],'Gemfile'), 'w+' do |f|
  f.puts Jslib::utils_gemfile_erb
end
File.open File.join(Dir.pwd, ARGV[0],'Gemfile'), 'w+' do |f|
  f.puts Jslib::utils_gemfile_erb
end
File.open File.join(Dir.pwd, ARGV[0],'Guardfile'), 'w+' do |f|
  f.puts Jslib::utils_gemfile_erb
end
File.new File.join(Dir.pwd, ARGV[0],'coffee-scripts',"#{ARGV[0]}.coffee"), 'w+'
