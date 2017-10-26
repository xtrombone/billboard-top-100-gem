Gem::Specification.new do |s|
  s.name        = 'billboard-top-100'
  s.version     = '1.1.0'
  s.date        = '2017-10-26'
  s.summary     = "Billboard Hot 100"
  s.description = "Retrieve top 100 lists from Billboard"
  s.authors     = ["Rishi Masand"]
  s.email       = 'masandrishi@gmail.com'
  s.files       = ["lib/billboard-top-100.rb", "lib/track.rb"]
  s.homepage    = 'http://rubygems.org/gems/billboard-top-100'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', '~>0.15.6'
  s.add_runtime_dependency 'nokogiri', '~>1.8.1'
end
