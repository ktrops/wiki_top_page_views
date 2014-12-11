
class Find
  def initialize(opts={})
    @lang = opts[:lang] || "en"
    @top_num = opts[:top_num] || 10
    @file = opts[:file] 
  end
  
  def open_file
    puts "opening file: #{@file}"
    lang_array = IO.readlines(@file)
    lang_array.map! {|s| s.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '.') }
  end
  
  def find_lang
  	lang_array = open_file
  	puts "finding language #{@lang}"
  	lang_array.select! { |line| /\A#{@lang}/i =~ line}
  	lang_array.map! {|s| s.split(" ")}
  	lang_array.select! {|line| line[1] !~ /^File|^Special/i}
  	space = lang_array.select {|line| line[4] != nil}
  	lang_array.delete_if {|line| line[4] != nil}
    space.map! {|line| "#{line[0]}, #{line[1] + line[2]}, #{line[3]}, #{line[4]}".split(", ")}
    return lang_array.concat(space)
  end
  
  def sort_array
    lang_array = find_lang
    puts "sorting file"
    sort_a = lang_array.sort_by {|array| -array[2].to_i}
    return sort_a
  end
  
  def top_topics
    s_array = sort_array
    puts "getting top #{@top_num}"
    top_a = s_array.first(@top_num).map!{ |line| "Topic: " + line[1] + "," + " Visits: " + line[2] }
    return top_a  
   end
   
 end
 
 

 