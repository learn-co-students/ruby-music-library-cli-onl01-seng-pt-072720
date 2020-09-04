class Artist

    extend Concerns::Findable 

    attr_accessor :name, :songs
    
    @@all = []

    def initialize(name)
        @name = name 
        save 
        @songs = [] 
    end
    
    def self.all
        @@all
    end
    
    def save
        self.class.all << self 
    end
    
    def self.destroy_all 
        @@all.clear
    end
    
    def self.create(name)
        new_artist = self.new(name)
        new_artist 
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        if @songs.include?(song) == false 
                @songs << song 
        end

    end

    def songs 
        @songs
    end
    
    def genres 
        songs.collect do |song|
            song.genre 
        end.uniq
    end






end
