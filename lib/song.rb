require 'pry'

class Song 
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist, :genre 
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist=(artist) 
        self.genre=(genre)
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
        song = self.new(name) 
        song.save 
        song
    end 

    def artist=(artist)
        @artist = artist
        if artist != nil
            artist.add_song(self)
        end 
    end 

    def genre=(genre)
        @genre = genre 
        if genre != nil && !genre.songs.include?(self)
            genre.songs << self 
        end 
    end 

    def self.new_from_filename(filename)
        artist_name, song_name, genre_name = filename.gsub(".mp3", "").split(" - ")
        
        song = self.new(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song 
    end 

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
    end 
end 