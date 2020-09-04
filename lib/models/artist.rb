require_relative '../../lib/concerns/findable.rb'

class Artist 

  extend Concerns::Findable

  attr_accessor :name, :songs, :genre, :song
  
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
    end
    unless @songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    @songs.map{|song| song.genre}.uniq
  end
  
end

# binding.pry