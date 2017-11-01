class Album
  attr_accessor :title
  attr_accessor :artist
  attr_accessor :rank
  attr_accessor :image

  def initialize(title, artist, rank, image)
    @title = title
    @artist = artist
    @rank = rank
    @image = image
  end
end
