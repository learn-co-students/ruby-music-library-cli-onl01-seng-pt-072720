class Artist
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
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
        artist = Artist.new(name)
        artist.save
        artist
    end
    def add_song(song)
        if !song.artist   
            song.artist = self 
        end
        if !@songs.include? song  
            @songs << song
        end
    end

end