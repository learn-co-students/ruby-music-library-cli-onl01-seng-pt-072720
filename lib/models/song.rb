class Song 
  attr_accessor :name, :artist, :genre
  
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist!=nil
    @genre = genre
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def self.create(song_name) 
    song = self.new(song_name) 
    song.save
    song
  end
 
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    artist
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self
  end
  
  
end