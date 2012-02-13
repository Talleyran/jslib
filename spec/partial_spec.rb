require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include Jslib
describe "Generator" do

  it "should render partial gxp_extend_tool in project dir" do
    Dir.mkdir '/tmp/rspec' unless File.exist? '/tmp/rspec'
    FileUtils.rm_r File.join('/tmp','rspec','my_super_lib') if File.exist? File.join('/tmp','rspec','my_super_lib')
    Generator::Project.new( File.join('/tmp','rspec'), project_name: 'my_super_lib', sxss: 'sass' ).run!
    Generator::Partial.new( File.join('/tmp','rspec','my_super_lib'), partial_name: 'my_super_tool', kind: 'gxp_extend_tool' ).run!
    File.exist?(File.join('/tmp','rspec','my_super_lib','lib','coffeescripts','my_super_tool.coffee')).should be_true
  end

  it "should render partial gxp_extend_tool in project dir" do
    Dir.mkdir '/tmp/rspec' unless File.exist? '/tmp/rspec'
    FileUtils.rm_r File.join('/tmp','rspec','my_super_lib') if File.exist? File.join('/tmp','rspec','my_super_lib')
    Generator::Project.new( File.join('/tmp','rspec'), project_name: 'my_super_lib', sxss: 'sass' ).run!
    Generator::Partial.new( File.join('/tmp','rspec','my_super_lib'), partial_name: 'my_super_tool', kind: 'gxp_extend_tool' ).run!
    File.new(File.join('/tmp','rspec','my_super_lib','lib','coffeescripts','my_super_tool.coffee')).read.match('my_super_tool'.camelize).should_not be_nil
  end

  it "should create template custom dir (in project dir)" do
  end

  it "should not any file if template is unknown" do
  end

  it "should not render partial not in project dir" do
  end


end

