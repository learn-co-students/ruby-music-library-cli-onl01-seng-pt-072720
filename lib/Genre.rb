class Genre

    extend Concerns::Findable

    attr_accessor :name

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

    def self.create(genre)
        genre = self.new(genre)
        genre.save
        genre
    end

    def songs
        @songs
    end

    #def add_song(song)
    #    song.genre = self if song.genre == nil
    #    self.songs << song  if self.songs.include?(song) == false
    #end

    def artists
        self.songs.collect {|song| song.artist}.uniq
    end



end