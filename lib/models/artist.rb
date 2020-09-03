class Artist 
  attr_accessor :name, :artist, :songs
  
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def self.create(artist_name) 
    artist = self.new(artist_name) 
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
      @songs << song
    end
  end
    
    
end