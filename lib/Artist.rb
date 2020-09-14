   class Artist
   
    extend Concerns::Findable
    
    attr_accessor :name, :song, :genre

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
        self.new(name).save
        self
    end

    def songs
        @songs 
    end 

    def genres
        @genres = []
        @songs.each do |song|
          unless @genres.include?(song.genre)
            @genres << song.genre
          end
        end
        @genres
      end

    def add_song(song)
        if song.artist == nil
          song.artist = self
        else
          nil
        end
        unless @songs.include?(song)
            @songs << song
        end
        song
      end

end