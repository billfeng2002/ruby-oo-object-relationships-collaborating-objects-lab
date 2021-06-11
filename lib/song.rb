class Song
  @@all = []
  def self.all
    @@all
  end

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    name = filename.split(" - ")[1].split(".")[0]
    new_song = Song.new(name)
    new_song.artist_name = artist_name
    return new_song
  end

  def artist_name=(artist_name)
    self.artist=Artist.find_or_create_by_name(artist_name)
  end
end
