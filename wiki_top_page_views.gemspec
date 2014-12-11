Gem::Specification.new do |s|
s.name = 'wiki_top_page_views'
s.version = '0.0.0'
s.date = '2014-12-10'
s.summary = "Returns the top viewed wikipedia pages"
s.description = "This gem parses data from files at http://dumps.wikimedia.org/other/pagecounts-raw/ to get the top viewed pages"
s.authors = ["Katie Atrops"]
s.email = 'katrops@gmail.com'
s.homepage = 'http://rubygems.org/gems/wiki_top_page_views'
s.licenses = ['MIT']
s.files = ["lib/wiki_top_page_views.rb"]
s.add_development_dependency "rspec", '3.1.0'
s.add_development_dependency "rake", '10.4.2'
s.add_development_dependency "rspec-encoding-matchers", '0.1.0'
s.executables = ['top_page']
end