class Song 
  attr_accessor :name, :artist, :genre
  
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist!=nil
    self.genre = genre if genre !=nil
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
    genre.songs << self if !genre.songs.include?(self)
    
  end
  
  def self.find_by_name(name) 
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name) 
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    split_name = filename.split(" - ")
    song_artist = split_name[0]
    song_name = split_name[1]
    
    new_song = self.new(name)
    new_song.artist = song_artist
    new_song
    
  end
  
end