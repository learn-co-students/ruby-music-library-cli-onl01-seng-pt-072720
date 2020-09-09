require 'pry'
require_relative "artist.rb"
class Song
@@all = []

attr_accessor :name, :artist, :genre

    # def initialize(name, artist = nil)
    #     @name = name
    #     @artist = artist=(artist)
    # end
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
      end

# binding.pry
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(song)
        # self.new(name).save
        # self
        song = self.new(song)
        song.save
        song
    end

    def artist
        @artist
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
  end

  def genre
    @genre
  end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    
    # def self.find_by_name(name)
    #     @@all.detect do |song|
    #       song.name == name
    #     end
    #   end
    def self.find_by_name(name)
        @@all.detect do |song|
            song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file_name)
        cleaned = file_name.split(".mp3")[0]
        parsed = cleaned.split(" - ")
        artist_name = parsed[0]
        song_name = parsed[1]
        genre_name = parsed[2]
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        new(song_name,artist,genre)
    end
    
    def self.create_from_filename(file_name)
        new_from_filename(file_name).save
    end
    
end

