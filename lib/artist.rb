class Artist
    attr_accessor :name
    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def songs
        @songs
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
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        unless self.songs.include?(song)
            self.songs << song
        end
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end

end