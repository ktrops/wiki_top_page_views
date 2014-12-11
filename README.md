home  :: www.rubygems.org/gems/wiki_top_page_views

code  :: www.github.com/ktrops/wiki_top_page_views



#Description

This gem parses the information from the wikipedia page count dump files and returns a number of most viewed pages


#Usage

This gem assumes you have already downloaded the wiki page view files from http://dumps.wikimedia.org/other/pagecounts-raw/

example:
 
   ./top_page -f filename -l language -c count


Filename is the name of the file. This parameter is required. You must also include the complete file path.

Language is the two letter language code. This is an optional parameter. the default is en

Count is how many top subjects you want to return. This is an optional parameter. The default is 10 

example:

	./top_page -f ../../pagecounts-20141101-000000 -l en -c 10 
	
=>	["Topic: en, Visits: 4405366", "Topic: Main_Page, Visits: 324171", "Topic: Online_shopping, Visits: 38403", "Topic: Malware, Visits: 27009", "Topic: Halloween, Visits: 25353", "Topic: Thanksgiving, Visits: 20982", "Topic: Cyber_Monday, Visits: 20795", "Topic: Black_Friday, Visits: 20732", "Topic: Detox, Visits: 15366", "Topic: English_alphabet, Visits: 12942"]


#Requirements

 rspec 

 rspec_encoding_matchers
 
 rake

#Install

sudo gem install wiki_top_page_views




