require 'billboard-top-100'

billboard = BillboardTop100.new()

# date format YYYY-MM-DD (defaults to saturday of current week)

tracks = billboard.getTop100("2016-11-12")
tracks.each do |track|
	puts track.title.to_s
	puts track.artist.to_s
	puts track.rank.to_s
	puts track.cover.to_s
	puts "\n"
end