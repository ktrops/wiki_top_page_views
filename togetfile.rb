To open a webpage for different years and months

require 'uri'

uri = URI.parse('http://www.example.com/search.cgi'),
params = { :q => "ruby", :max => "50" }

# Add params to URI
uri.query = URI.encode_www_form( params )

require 'open-uri'

url = "http://dumps.wikimedia.org/other/pagecounts-raw/2014/2014-11/pagecounts-20141101-000000.gz" 
local_fname = "pagecounts-20141102"
File.open(local_fname, "w")
