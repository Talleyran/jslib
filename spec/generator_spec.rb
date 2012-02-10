require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include Jslib
describe "Generator" do

  it "should add each javascript template to template's list" do
    Dir.mkdir '/tmp/rspec' unless File.exist? '/tmp/rspec'
    FileUtils.rm_r File.join('/tmp','rspec','my_super_lib') if File.exist? File.join('/tmp','rspec','my_super_lib')
    Generator::Project.new( File.join('/tmp','rspec'), project_name: 'my_super_lib', sxss: 'sass' ).run!
    File.exist?(File.join('/tmp','rspec','my_super_lib')).should be_true
  end

end

