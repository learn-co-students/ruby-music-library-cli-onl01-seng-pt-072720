class Artist 
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
    @@all = []
    
    def initialize(name = nil)
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

    def self.create(name)
        artist = self.new(name)
        artist.save 
        artist 
    end 

    def add_song(song)
        song.artist == self || song.artist = self
        @songs.include?(song) || @songs << song 
    end 

    def genres 
        self.songs.collect {|song| song.genre}.uniq
    end 
end 
