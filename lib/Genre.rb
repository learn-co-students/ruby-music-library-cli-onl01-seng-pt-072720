class Genre 
    
extend Concerns::Findable

attr_accessor :name, :song

@@all = [] 

def initialize(name)
    @name = name
    @songs = [] 
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

def self.create(name)
    self.new(name).tap {|g| g.save}
end

def songs
    @songs 
end 

def add_song(song)
    if song.genre != self
        song.genre = self
        @songs << song 
    end 
end

def artists
    @artists = []
    @songs.each do |song|
      unless @artists.include?(song.artist)
        @artists << song.artist
      end
    end
    @artists
  end

end