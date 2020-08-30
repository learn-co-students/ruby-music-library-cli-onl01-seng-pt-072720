class Song
    attr_accessor :name, :genre
    attr_reader :artist, :genre
    @@all = []
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
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
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
        artist
    end
    def genre=(genre)
        @genre = genre
        @genre.songs << self if !@genre.songs.include? self
    end
    def self.find_by_name(name)
        @@all.find {|song| song.name == name}
    end
    def self.find_or_create_by_name(name)
        !Song.find_by_name(name) ? Song.create(name) : Song.find_by_name(name)
    end
    def self.new_from_filename(filename)
        artist_name = filename.split(' - ')[0]
        song_name = filename.split(' - ')[1]
        genre = filename.split(' - ')[2].delete_suffix!('.mp3')
        new_artist = Artist.find_or_create_by_name(artist_name)
        new_genre = Genre.find_or_create_by_name(genre)
        Song.new(song_name, new_artist, new_genre)
    end
    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end
end 