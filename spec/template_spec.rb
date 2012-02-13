require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include Jslib

describe "Template" do
  it "should return erb template" do
    Template::template('gemfile.erb').class.should eq(ERB)
  end

  it "templates should return hash" do
    Template::templates.class.should eq(Hash)
  end

  it "should return text from template" do
    Template::templates[ :gemfile_erb ].result.class.should eq(String)
  end

  it "should return text from template" do
    Template::templates[ :utils_gemfile_erb ].result.class.should eq(String)
  end

  it "should return text from template" do
    s = Template::templates[ :guardfile_erb ].result 'sass'
    (s =~ /sass/).should_not be_nil
    s.split("\n").size.should eq(2)
  end

  it "should contain instance in templates for each template" do
    dir = File.join( [File.dirname(__FILE__), '..', 'lib', 'jslib', 'templates'] )
    Dir["#{dir}/**/*.{erb}"].each do |f|
      short_file_name = f[dir.size+1..-1]
      unless File.directory?( f ) || short_file_name[0..0] == '.'
        Template::templates.keys.include?(Template::tamplate_place_to_method_name(short_file_name).to_sym).should be_true
      end
    end
  end

  it "should add each javascript template to template's list" do
    dir = File.join( [File.dirname(__FILE__), '..', 'lib', 'jslib', 'templates', 'javascripts'] )
    Dir["#{dir}/**/*.{erb}"].size.should eq(Template::list.size)
  end

  it "should return array of template attributes" do
    s = Template::templates[ :guardfile_erb ].attributes.should eq ['@sxss']
  end

end
