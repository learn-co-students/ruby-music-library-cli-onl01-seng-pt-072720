class Song 
  attr_accessor :name, :artist
  
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    self.artist = artist if artist!=nil
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
    
    # name.add_song(self)
    # if artist != nil 
    #   # self.artist = artist
    #   artist.name.add_song(self)
    # end
  
  end
  
  
end