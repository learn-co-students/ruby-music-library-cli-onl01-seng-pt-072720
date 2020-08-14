require 'pry'

class Artist
    extend Concerns::Findable
    attr_accessor :name, :musicimporter, :musiclibrarycontroller
    attr_reader :songs, :genres

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
        artist = Artist.new(name)
        artist.save
        artist
    end

    def self.songs
        @songs
    end

    def add_song(song)
        song.artist = self unless song.artist == self
        @songs << song unless songs.include?(song)
    end

    def genres
        genre_array = songs.map {|s| s.genre}
        genre_array.uniq
    end

    # def self.find_or_create_by_name(name)
    #     f_a = @@all.find {|artist| artist.name == name}
    #     if f_a 
    #       f_a
    #     else
    #         artist = self.new(name)
    #         artist
    #     end
    #   end

end