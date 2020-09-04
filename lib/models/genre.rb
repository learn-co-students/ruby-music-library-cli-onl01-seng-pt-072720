class Genre

    extend Concerns::Findable  
    
    attr_accessor :name, :songs 
    
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
        save 
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
        new_genre = self.new(name)
        new_genre
    end

    def artists 
        songs.collect do |song|
            song.artist 
        end.uniq
    end



end
