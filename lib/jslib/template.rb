module Jslib
  module Template

    @dir = File.join( [File.dirname(__FILE__), 'templates'] )

    def self.tamplate_place_to_method_name file_name
      file_name.gsub(/(\.|\\|\/)/,'_').downcase
    end

    Find.find @dir do |f|
      short_file_name = f[@dir.size+1..-1]
      unless File.directory?( f ) || short_file_name[0..0] == '.'
        self.class_eval <<EOF
          def self.#{ tamplate_place_to_method_name short_file_name } #{
              unless ( m = File.new(f).read.match /^<%#(.+)%>/ ).nil?; m[1] end
            }
            template('#{short_file_name}').result(binding)
          end
EOF
      end
    end

    def self.template file
      ERB.new File.new( File.join( [File.dirname(__FILE__), 'templates' , file] ) ).read
    end

  end
end
