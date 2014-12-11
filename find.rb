
puts "please input language you want for top 10 results:"
lang = gets.chomp
class Find
  
  def find_lang
  	p_file = File.open("pagecounts-20141101-000000", "r")
  	p_file.puts "Opening file pagecounts-20141101-000000"
  	@lang_array = []
  	while !p_file.eof?
  		line = p_file.readline.split(' ')
  		if line[0].downcase == "en"
  		  if line[1] =~ /^File/
  		    next
  		  else
  		    @lang_array.push(line[1,2])
  		  end
  	 end
   end
  end
  
  def sort
    lang_hash = Hash[@lang_array.each { |v| [v] }]
    @s_hash = Hash[lang_hash.sort_by {|key, value| value.to_i}]
  end
  
  def top_10
     array_10 = []
     i = -1
    values_a = @s_hash.values
    while i >= -10
     v = values_a[i]
     array_10.push(@s_hash.key(v))
     i -= 1
     puts abs(i) + @s_hash.key(v)
     end
     
   end
   
   
   
   
 end
 
 Find.new
 
 
 