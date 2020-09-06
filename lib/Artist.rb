class Artist

    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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

    def self.create(artist)
        artist = self.new(artist)
        artist.save
        artist
    end
    
    def add_song(song)
        song.artist = self if song.artist == nil
        self.songs << song  if self.songs.include?(song) == false
    end

    def genres
        self.songs.collect {|song| song.genre}.uniq
    end

end