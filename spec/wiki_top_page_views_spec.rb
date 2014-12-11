require_relative 'spec_helper.rb'
require_relative '../lib/wiki_top_page_views.rb'
require 'rspec-encoding-matchers'

describe Find do
  
  include RSpecEncodingMatchers
  
    
  
  it "should return only English lines" do
    result = Find.new(file: 'testfile1').find_lang
    
    result[0][0].should eq("en")
  end
  
  before do 
    @find = Find.new(file: 'testfile2', top_num: 15)
  end
  
  it "should open a file" do
    File.exists? "testfile2"
    
  end
  
  it "should convert file to utf-8 encoding" do
    result = @find.open_file
    result.to_s.should be_encoded_as("UTF-8")
  end
    
  it "should ignore all subjects starting with file or special" do
    result = @find.find_lang.map! { |line| line[1]}
    result.should_not eq(/^file|^special/i)
  end 
  
  it "should sort an array by number of visits from largest to smallest" do
    result = @find.sort_array.map { |line| line[2]}
    result.should eq(result.sort.reverse) 
  end
    

  
  it "should return a number of top topics" do
    result = @find.top_topics
    result.size.should eq(15)
  end
end















