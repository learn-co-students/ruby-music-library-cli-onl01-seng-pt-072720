class Genre
    extend Concerns::Findable

    attr_accessor :name, :musicimporter, :musiclibrarycontroller
    attr_reader :songs, :artists

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
        genre = Genre.new(name)
        genre.save
        genre
    end 

    def self.songs
        @songs
    end

    def artists
        artist_array = songs.map {|s| s.artist} 
        artist_array.uniq
     end
end