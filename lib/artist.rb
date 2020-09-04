class Artist 
    
    attr_accessor :name 
    extend Concerns::Findable
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
    end

    def self.all
        @@all 
    end

    def self.destroy_all
        @@all = []
    end 

    def save
        @@all << self
    end 

    def self.create(name)
        artist = Artist.new(name)
        artist.save 
        return artist
    end 

    def songs 
        @songs
    end 

    def add_song(song)
        #if song.artist == nil && !songs.include?(song)
        song.artist = self if song.artist == nil
        songs << song if !@songs.include? (song)
    end 

    def genres
        songs.collect {|song| song.genre}.uniq
    end 
end