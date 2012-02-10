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
          f.puts Template::readme_erb
        end
        File.open File.join(@dir, @options[:project_name],'Gemfile'), 'w+' do |f|
          f.puts Template::gemfile_erb
        end
        File.open File.join(@dir, @options[:project_name],'Guardfile'), 'w+' do |f|
          f.puts Template::guardfile_erb
        end

        #lib

        Dir.mkdir File.join(@dir, @options[:project_name],'lib')
        Dir.mkdir File.join(@dir, @options[:project_name],'lib', 'coffee-scripts')
        Dir.mkdir File.join(@dir, @options[:project_name],'lib', "#{@options[:sxss]}")
        File.new File.join(@dir, @options[:project_name],'lib','coffee-scripts',"#{@options[:project_name]}.coffee"), 'w+'


        #public

        Dir.mkdir File.join(@dir, @options[:project_name],'public')
        Dir.mkdir File.join(@dir, @options[:project_name],'public','javascripts')
        Dir.mkdir File.join(@dir, @options[:project_name],'public','stylesheets')
        Dir.mkdir File.join(@dir, @options[:project_name],'public','images')


        #other

        Dir.mkdir File.join(@dir, @options[:project_name],'utils')
        Dir.mkdir File.join(@dir, @options[:project_name],'examples')
        File.open File.join(@dir, @options[:project_name],'utils','Gemfile'), 'w+' do |f|
          f.puts Template::utils_gemfile_erb
        end
      end
    end
  end
end
