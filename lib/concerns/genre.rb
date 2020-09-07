class Genre
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def self.all
        @@all
    end

    def songs
        @songs
    end

    def artists
        artists = []
        songs.collect do | song |
            artists << song.artist
        end
        artists.uniq
    end

    def save
        @@all << self
    end

    def add_song(song)
        if song.genre != self
            song.genre = self
        end
        if !@songs.include?(song)
            @songs << song
        end
    end

    def self.destroy_all
        @@all.clear
    end
end