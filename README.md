# billboard-top-100-gem
Ruby gem to retrieve top 100 songs from Billboard's "The Hot 100"

# install

```
gem install billboard-top-100
```

# example

```ruby
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

artists = billboard.getArtist100("2016-11-12")
artists.each do |artist|
	puts artist.name.to_s
	puts artist.rank.to_s
	puts artist.image.to_s
	puts "\n"
end
```
# api

### tracks

Type: `array`

Track objects.

### trackObject.rank

Type: `number`

Rank of song on charts.

### trackObject.title

Type: `string`

Title of song.

### trackObject.artist

Type: `string`

Name of artist of song.

### trackObject.cover

Type: `object`

Cover image URL of song.

### artists

Type: `array`

Artist objects.

### artistObject.rank

Type: `number`

Rank of artist on charts.

### artistObject.name

Type: `string`

Name of artist.

### artistObject.image

Type: `object`

Image URL of artist.

# license

MIT © [Rishi Masand](https://github.com/darthbatman)
