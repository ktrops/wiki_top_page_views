#Encoding: utf-8
#require 'uri'
#URI.parse

#puts "please input language you want:"
#lang = gets.chomp
#puts "Enter the number of top wikipedia subjects you want:"
#top_num = gets.chomp
class Find
  def initialize(opts={})
    @lang = opts[:lang] || "en"
    @top_num = opts[:top_num] || 10
    @file = opts[:file] || "pagecounts-20141101-000000"
  end
  
  def find_lang
  	#p_file.set_encoding("utf-8", "utf-8")
  	lang_array = IO.readlines(@file)
  	puts "opening file: #{@file}"
  	
  	lang_array.map! {|s| s.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '.') }
  	lang_array.select! { |line| /\A#{@lang}/i =~ line}
  	lang_array.map! {|s| s.split(" ")}
  	lang_array.select! {|line| line[1] !~ /^File|^Special/i}
  	space = lang_array.select {|line| line[4] != nil}
  	lang_array.delete_if {|line| line[4] != nil}
    space.map! {|line| "#{line[0]}, #{line[1] + line[2]}, #{line[3]}, #{line[4]}".split(", ")}
    lang_array.concat(space)
    
  	
  end
  
  def sort_array
    lang_array = find_lang
    puts "sorting file"
    lang_array.sort_by {|array| -array[2].to_i}
    
    
  end
  
  def top_topics
    s_array = sort_array
    puts "getting top #{@top_num}"
    s_array.first(@top_num).map{ |line| "Topic: " + line[1] + "," + " Visits: " + line[2] }  
   end
   
 end
 
 if $0 == __FILE__
 f = Find.new(file: 'testfile2')
 test = f.top_topics
 #f.sort
 #f.top_10
 end
 
   
   
   
   
=begin
      array_10 = []
     i = -1
    values_a = @s_hash.values
    while i >= -10
     v = values_a[i]
     array_10.push(@s_hash.key(v))
     i -= 1
     puts abs(i) + @s_hash.key(v)
     end
     
     	while !p_file.eof == true
    		line = p_file.readline
    		if line[0..2] =~ /^@lang /
    		  puts line
    		  if line[0..3] =~ /^File/
    		    next
    		  else
    		    @lang_array.push(line.split(' ')[1,2])
    		  end
   		end
     end

      @lang_array
     
=end


=begin
p_file.each {|line| @lang_array.push[line]}
@lang_array.select {|line| line[0] = @lang && line[1] !~ /^File/}
=end
 