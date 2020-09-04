
class Song
  
  extend Concerns::Findable 
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
 
  attr_accessor :name, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
    save
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
      @@all.clear
  end
  
    def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
        
  
  
 
    
end