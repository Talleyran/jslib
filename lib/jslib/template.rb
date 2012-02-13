module Jslib
  class Template
    require 'erb'
    require 'active_support/inflector'

    TemplatesDir = File.join( [File.dirname(__FILE__), 'templates'] )

    def self.tamplate_place_to_method_name file_name
      file_name.gsub(/(\.|\\|\/)/,'_').downcase.to_sym
    end

    def self.add_to_list short_file_name
      if short_file_name =~ /javascripts/
        self.list << tamplate_place_to_method_name( short_file_name )[12..-5] #cut javascripts_ and _erb
      end
    end

    def self.list
      @list ||= []
    end

    def self.template file
      ERB.new File.new( File.join( [File.dirname(__FILE__), 'templates' , file] ) ).read
    end

    def self.templates
      return @templates unless @templates.nil?
      @templates = {}
      Dir["#{TemplatesDir}/**/*.{erb}"].each do |f|
        short_file_name = f[TemplatesDir.size+1..-1]
        unless File.directory?( f ) || short_file_name[0..0] == '.'
          add_to_list short_file_name
          @templates[tamplate_place_to_method_name short_file_name] = self.new short_file_name
        end
      end
      @templates
    end

    def initialize file_name
      @file_name = file_name
      @template = self.class.template file_name
    end

    def result *params
      attributes.each.with_index{|v,i| self.instance_variable_set(v, params[i])} unless attributes.nil?
      @template.result(binding)
    end


    def attributes
      f = File.join(TemplatesDir, @file_name)
        puts '--------------------'
        puts File.new(f).read
        puts '--------------------'
      unless ( m = File.new(f).read.match /^<%#(.+)%>/ ).nil?
        m[1].split(',')
      end
    end

  end
end
