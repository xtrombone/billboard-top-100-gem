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