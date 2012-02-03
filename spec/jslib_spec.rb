require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Jslib" do
  it "should create dir (root of library)" do
    puts File.join File.expand_path(File.dirname(__FILE__)), '..', 'bin', 'jslib'
  end
end
