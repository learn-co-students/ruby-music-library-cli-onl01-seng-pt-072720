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
        if song.artist.name == "Unknown"
            song.artist = self 
        else
            song.artist
        end
        @songs << song
        @songs.uniq!
    end

end