class Song
    attr_accessor :name
    attr_reader :artist
    @@all = []
    def initialize(name, artist = nil)
        @name = name
        self.artist = artist 
    end
    def self.all
        @@all
    end
    def self.destroy_all
        self.all.clear
    end
    def save
        @@all << self
    end
    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end
    def artist=(artist)
        self.artist = artist
        artist.add_song(self)
    end
    
end 