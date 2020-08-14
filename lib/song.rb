require 'pry'
class Song
    extend Concerns::Findable

    attr_accessor :name, :musicimporter, :musiclibrarycontroller
    attr_reader :artist, :genre
    
    
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist unless !artist
        self.genre = genre  unless !genre
        
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
        song = Song.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist 
        artist.add_song(self)
    end

    def genre=(genre)
        @genre= genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
       all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if !find_by_name(name)
            new_song = self.create(name)
        else find_by_name(name)
        end
    end

    def self.new_from_filename(filename)
       array = filename.chomp(".mp3").split(" - ")
       song_name = array[1]
       song_artist = array[0]
       song_genre = array[2]

       artist = Artist.find_or_create_by_name(song_artist)
       genre = Genre.find_or_create_by_name(song_genre)
       self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end


end