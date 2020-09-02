class Song 
    extend Concerns::Findable
    attr_accessor :name, :artist
    attr_reader :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
    end

    def self.new_from_filename(filename)
        info = filename.gsub(".mp3","").split(" - ").to_a
        artist_name, song_name, genre_name = info[0], info[1], info[2]

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        new(song_name, artist, genre)
    end
    
    def self.create_from_filename(filename)
        new_from_filename(filename).save #.tap {|s| s.save }
    end
end