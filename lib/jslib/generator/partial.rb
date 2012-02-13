module Jslib
  module Generator
    class Partial
      def initialize dir, options
        @options = options
        @dir = dir
      end
      def run!
        template_name = "javascripts_#{@options[:kind]}_erb"
        File.open File.join(@dir,'lib','coffeescripts',"#{ @options[:partial_name] }.coffee"), 'w+' do |f|
          f.puts Template.send(template_name, *Template.attributes( template_name ).map{|el| @options[el]} )
        end
      end
    end
  end
end
