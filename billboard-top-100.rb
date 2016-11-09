require 'HTTParty'
require 'Nokogiri'

class Track
	attr_accessor :title
	attr_accessor :artist
	attr_accessor :rank
	attr_accessor :cover
	def initialize(title, artist, rank, cover)
		@title = title
		@artist = artist
		@rank = rank
		@cover = cover
	end
end

def parse_page(url)
	tracks = []
	titles = []
	artists = []
	covers = []
	page = HTTParty.get(url)
	parser = Nokogiri::HTML(page)
	parser.css('.chart-row__song').each do |title|
		titles.push(title.text)
	end
	parser.css('.chart-row__artist').each do |artist|
		artists.push(artist.text)
	end
	parser.css('.chart-row__image').each do |cover|
		if cover.to_s.include? 'background-image'
			covers.push(cover.to_s.split('url(')[1].to_s.split(')')[0])
		else
			covers.push(cover.to_s.split('imagesrc="')[1].to_s.split('">')[0])
		end
	end
	for i in 0..99
		track = Track.new(titles[i], artists[i], i + 1, covers[i])
		tracks[i] = track
	end
	return tracks
end

if __FILE__ == $0
	tracks = parse_page('http://www.billboard.com/charts/hot-100')
	tracks.each do |track|
		puts "#{track.title}, #{track.artist}, #{track.rank}, #{track.cover}"
	end
end
