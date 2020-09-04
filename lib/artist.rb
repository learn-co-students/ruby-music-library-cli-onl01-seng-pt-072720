class Artist
  
  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end
  
   def self.destroy_all
      @@all.clear
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
      if song.artist == nil
        song.artist = self
      end
      if !@songs.include?(song)
        @songs << song
      end
    end
    
    def genres
  end


end