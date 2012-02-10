module Jslib
  module Template
    require 'erb'

    def self.tamplate_place_to_method_name file_name
      file_name.gsub(/(\.|\\|\/)/,'_').downcase
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

    @dir = File.join( [File.dirname(__FILE__), 'templates'] )
    Dir["#{@dir}/**/*.{erb}"].each do |f|
      short_file_name = f[@dir.size+1..-1]
      unless File.directory?( f ) || short_file_name[0..0] == '.'
        add_to_list short_file_name
        self.class_eval <<EOF
          def self.#{ tamplate_place_to_method_name short_file_name } #{
              unless ( m = File.new(f).read.match /^<%#(.+)%>/ ).nil?; m[1] end
            }
            template('#{short_file_name}').result(binding)
          end
EOF
      end
    end
  end
end
