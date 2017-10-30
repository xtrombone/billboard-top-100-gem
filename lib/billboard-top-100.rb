require 'httparty'
require 'nokogiri'
require 'track'
require 'artist'
require 'album'

class BillboardTop100
	def getTop100(date = "")
		url = 'http://www.billboard.com/charts/hot-100'
		if date.length > 0
			url += '/' + date
		end
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
			artists.push(artist.text.to_s.squeeze(" ")[1..artist.to_s.length - 1].gsub("\n", ""))
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

  def getArtist100(date = "")
		url = 'http://www.billboard.com/charts/artist-100'
		if date.length > 0
			url += '/' + date
		end
    artists = []
		names = []
		images = []
		page = HTTParty.get(url)
		parser = Nokogiri::HTML(page)
		parser.css('.chart-row__artist').each do |artist|
			names.push(artist.text.to_s.squeeze(" ")[1..artist.to_s.length - 1].gsub("\n", ""))
		end
		parser.css('.chart-row__image').each do |image|
			if image.to_s.include? 'background-image'
				images.push(image.to_s.split('url(')[1].to_s.split(')')[0])
			else
				images.push(image.to_s.split('imagesrc="')[1].to_s.split('">')[0])
			end
		end
		for i in 0..99
			artist = Artist.new(names[i], i + 1, images[i])
			artists[i] = artist
		end
		return artists
  end

  def getBillboard200(date = "")
		url = 'http://www.billboard.com/charts/billboard-200'
		if date.length > 0
			url += '/' + date
		end
    albums = []
    artists = []
		titles = []
		images = []
		page = HTTParty.get(url)
		parser = Nokogiri::HTML(page)
		parser.css('.chart-row__song').each do |title|
			titles.push(title.text.to_s.squeeze(" ")[0..title.to_s.length - 1].gsub("\n", ""))
		end
		parser.css('.chart-row__artist').each do |artist|
			artists.push(artist.text.to_s.squeeze(" ")[1..artist.to_s.length - 1].gsub("\n", ""))
		end
		parser.css('.chart-row__image').each do |image|
			if image.to_s.include? 'background-image'
				images.push(image.to_s.split('url(')[1].to_s.split(')')[0])
			else
				images.push(image.to_s.split('imagesrc="')[1].to_s.split('">')[0])
			end
		end
		for i in 0..99
			album = Album.new(titles[i], artists[i], i + 1, images[i])
			albums[i] = album
		end
		return albums
  end
end
