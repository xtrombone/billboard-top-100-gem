class Artist
  attr_accessor :name
  attr_accessor :rank
  attr_accessor :image

  def initialize(name, rank, image)
    @name = name
    @rank = rank
    @image = image
  end
end
