module Jslib
  module Generator
    class Project
      def initialize dir, options
        @options = options
        @dir = dir
      end
      def run!
        require 'git'
        Git.init File.join(@dir, @options[:project_name])
        File.open File.join(@dir, @options[:project_name],'README'), 'w+' do |f|
          f.puts Template::templates[:readme_erb].result
        end
        File.open File.join(@dir, @options[:project_name],'Gemfile'), 'w+' do |f|
          f.puts Template::templates[:gemfile_erb].result
        end
        File.open File.join(@dir, @options[:project_name],'Guardfile'), 'w+' do |f|
          f.puts Template::templates[:guardfile_erb].result @options[:sxss]
        end

        #lib

        Dir.mkdir File.join(@dir, @options[:project_name],'lib')
        Dir.mkdir File.join(@dir, @options[:project_name],'lib', 'coffeescripts')
        Dir.mkdir File.join(@dir, @options[:project_name],'lib', "#{@options[:sxss]}")
        File.new File.join(@dir, @options[:project_name],'lib','coffeescripts',"#{@options[:project_name]}.coffee"), 'w+'


        #public

        Dir.mkdir File.join(@dir, @options[:project_name],'public')
        Dir.mkdir File.join(@dir, @options[:project_name],'public','javascripts')
        Dir.mkdir File.join(@dir, @options[:project_name],'public','stylesheets')
        Dir.mkdir File.join(@dir, @options[:project_name],'public','images')


        #other

        Dir.mkdir File.join(@dir, @options[:project_name],'templates')
        Dir.mkdir File.join(@dir, @options[:project_name],'utils')
        Dir.mkdir File.join(@dir, @options[:project_name],'examples')
        File.open File.join(@dir, @options[:project_name],'utils','Gemfile'), 'w+' do |f|
          f.puts Template::templates[:utils_gemfile_erb].result
        end
      end
    end
  end
end
