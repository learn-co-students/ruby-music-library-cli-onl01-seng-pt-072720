class Artist
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        self.new(name).tap {|s| s.save }
    end

    def add_song(song)
        song.artist = self if !song.artist
        songs << song if !songs.include?(song)
    end

    def genres
        songs.map {|song| song.genre}.uniq
    end
end