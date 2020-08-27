class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name, artist = Artist.new("Unknown"))
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
    # def artist=(name)
    #     add_song(self)
    # end
    
end 