class Artist
  
   extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all=[]
  
  def initialize(name)
    @name= name 
    @songs= []
  end
  
  def self.all
    @@all
  end
  
  def self.create(name)
    new_artist = new(name)
    new_artist.save
    new_artist
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
   def add_song(name)
    if name.artist == nil
      name.artist=(self)
    end
    if @songs.include?(name) == false
      @songs << name
    end
  end
  
  def genres
    songs.collect{|s| s.genre }.uniq
  end




end