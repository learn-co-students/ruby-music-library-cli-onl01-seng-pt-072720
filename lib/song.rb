require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name= name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
    end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear 
  end
  
  def save 
    @@all << self
  end
  
  def self.create(song)
    created_song = self.new(song) 
    created_song.save
    created_song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    end
    
    def genre=(genre)
      @genre = genre 
      unless genre.songs.include?(self)
        genre.songs << self
      end
    end
    
    def self.find_by_name(name)
      self.all.detect{|song| song.name == name}
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
  end
 end